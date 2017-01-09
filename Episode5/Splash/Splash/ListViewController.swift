//
//  ViewController.swift
//  Splash
//
//  Created by Dev on 12/12/2016.
//  Copyright © 2016 daftmobile. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

	let cellIdentifier: String = "randomIdentifier"
	let tableView: UITableView = UITableView()
	let search: UITextField = UITextField()

	private var urlString: String = ""
	private let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
	private var dataTask: NSURLSessionDataTask?

	private var hitsArray: NSArray = NSArray()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.whiteColor()
		search.translatesAutoresizingMaskIntoConstraints = false
		tableView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(search)
		view.addSubview(tableView)

		search.delegate = self
		search.backgroundColor = UIColor.lightGrayColor()

		tableView.delegate = self
		tableView.dataSource = self
		tableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = CGFloat(91)

		let con1 = NSLayoutConstraint.constraintsWithVisualFormat("H:|[search]|", options: [], metrics: nil, views: ["search" : search, "table" : tableView])
		let con2 = NSLayoutConstraint.constraintsWithVisualFormat("H:|[table]|", options: [], metrics: nil, views: ["search" : search, "table" : tableView])
		let con3 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-60-[search(25)][table]|", options: [], metrics: nil, views: ["search" : search, "table" : tableView])

		view.addConstraints(con1 + con2 + con3)
	}

	func performSearch() {
		if dataTask != nil {
			dataTask?.cancel()
		}
		let url: NSURL = NSURL(string: urlString)!
		dataTask = defaultSession.dataTaskWithURL(url) { data, response, error in
			if let error = error {
				print(error.localizedDescription)
			} else if let httpResponse = response as? NSHTTPURLResponse {
				if httpResponse.statusCode == 200 {
					self.updateSearchResults(data!)
				}
			}
		}
		dataTask?.resume()
	}

	func updateSearchResults(data: NSData) {
		let dictionary = try! NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
		hitsArray =  dictionary["hits"]! as! NSArray
		tableView.reloadData()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}

extension ListViewController: UITextFieldDelegate {

	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
		let newText: String = textField.text!.stringByReplacingOccurrencesOfString(" ", withString: "+").lowercaseString
		urlString = "https://pixabay.com/api/?key=3986715-6fdb9b164b35997357e2ab3a3&q=\(newText)&image_type=photo"
		return true
	}

	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		performSearch()
		return true
	}
}

extension ListViewController: UITableViewDataSource {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return hitsArray.count
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell: CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! CustomTableViewCell
		let photoUrl = NSURL(string: (hitsArray[indexPath.row] as! NSDictionary)["previewURL"] as! String)!

		let task = defaultSession.dataTaskWithURL(photoUrl) { (data, response, error) in
			let image = UIImage(data: data!)

			NSOperationQueue.mainQueue().addOperationWithBlock() {
				if let updatingCell: CustomTableViewCell = tableView.cellForRowAtIndexPath(indexPath) as? CustomTableViewCell {
					updatingCell.photo.image = image
				}
			}
		}
		task.resume()
		return cell
	}
}

extension ListViewController: UITableViewDelegate {
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let photoController: PhotoViewController = PhotoViewController(photoDictionary: hitsArray[indexPath.row] as! NSDictionary)
		navigationController?.pushViewController(photoController, animated: true)
	}
}
