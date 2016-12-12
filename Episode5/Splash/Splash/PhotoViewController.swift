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

		// set proper content mode for imageView
		// 'enable' autolayout for imageView
		// add constraints
    }


	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)

		// create data task from url (key in dictionary - "webformatURL")
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
