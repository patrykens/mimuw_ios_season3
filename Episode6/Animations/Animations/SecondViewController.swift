//
//  SecondViewController.swift
//  Animations
//
//  Created by Dev on 09/01/2017.
//  Copyright © 2017 daftmobile. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		super.init(nibName: nil, bundle: nil)
		title = "Second"
		view.backgroundColor = UIColor.whiteColor()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

