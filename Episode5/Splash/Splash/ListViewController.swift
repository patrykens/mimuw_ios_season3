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

	private var photoDictionariesArray: NSArray = NSArray()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.whiteColor()

		// 'enable' autolayout for views
		// delegate & datasource
		// setup tableView
		// setup constraints
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
					if let data = data {
						self.updateSearchResults(data)
					}
				}
			}
		}
		dataTask?.resume()
	}

	func updateSearchResults(data: NSData) {
		// update photoDictionariesArray
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}

extension ListViewController: UITextFieldDelegate {

	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
		// get text from textfield, change spaces to '+'
		// search url: "https://pixabay.com/api/?key=3986715-6fdb9b164b35997357e2ab3a3&q=[SEARCH_STRING]&image_type=photo"
		return true
	}

	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		// search
		return true
	}
}

extension ListViewController: UITableViewDataSource {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell: CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! CustomTableViewCell

		// for every cell create data task for photo NSURL (dictionary key "previewURL")
		// refresh image on main thread - NSOperationQueue.mainQueue().addOperationWithBlock() ...
		return cell
	}
}

extension ListViewController: UITableViewDelegate {
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		// create new PhotoVC and push on navigation stack
	}
}
