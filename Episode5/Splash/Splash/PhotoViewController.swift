//
//  PhotoViewController.swift
//  Splash
//
//  Created by Dev on 12/12/2016.
//  Copyright © 2016 daftmobile. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

	private let imageView: UIImageView = UIImageView()
	private let photoDictionary: NSDictionary

	private let defaultSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
	private var dataTask: NSURLSessionDataTask?

	init(photoDictionary: NSDictionary) {
		self.photoDictionary = photoDictionary
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.whiteColor()

		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = UIViewContentMode.ScaleAspectFit

		view.addSubview(imageView)

		let views: [String: AnyObject] = ["image" : imageView]
		let con1: [NSLayoutConstraint] = NSLayoutConstraint.constraintsWithVisualFormat("H:|[image]|", options: [], metrics: nil, views: views)
		let con2: [NSLayoutConstraint] = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(>=20)-[image]-(>=20)-|", options: [], metrics: nil, views: views)
		let midX = NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: CGFloat(1), constant: CGFloat(0))
		let midY = NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: CGFloat(1), constant: CGFloat(0))

		view.addConstraints(con1)
		view.addConstraints(con2)
		view.addConstraints([midX, midY])
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
	}

	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)

		let photoUrl = NSURL(string: photoDictionary["webformatURL"] as! String)!
		let task = defaultSession.dataTaskWithURL(photoUrl) { [unowned self] (data, response, error) in
			dispatch_async(dispatch_get_main_queue()) {
				self.imageView.image = UIImage(data: data!)
			}
		}
		task.resume()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}
