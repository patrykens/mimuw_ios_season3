//
//  ViewController.swift
//  Coelho
//
//  Created by Dev on 24/10/2016.
//  Copyright © 2016 asdf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let controller: ViewModel = ViewModel()

	@IBOutlet weak var quoteLabel: UILabel!
	@IBOutlet weak var quoteButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()

		controller.delegate = self

		view.addSubview(quoteButton)
		quoteButton.frame = CGRect(x: 100, y: 100, width: 150, height: 80)
		quoteButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)

		// ten addTarget w zależności od wersji swifta może nie działać ;)
		quoteButton.addTarget(self, action: #selector(quoteButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func quoteButtonPressed(button: UIButton) {
		controller.buttonPressed()
	}
}

extension ViewController: ControllerDelegate {
	func controllerDelegateReceivedQuote(quote: String) {
		quoteLabel.text = quote
	}
}
