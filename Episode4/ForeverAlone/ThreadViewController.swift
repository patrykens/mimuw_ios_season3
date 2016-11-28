//
//  ThreadViewController.swift
//  ForeverAlone
//
//  Created by Patryk Adamkiewicz on 28/11/16.
//  Copyright © 2016 Patryk Adamkiewicz. All rights reserved.
//

import UIKit

// Layout views
// Implement tableView's delegate and datasource protocols
// Implement "sending" message and reloading tableView
// Layout or color of UITableViewCell should determine the sender
// Add badge to tabBar showing unread messages count in specific thread
// Implement NSNotificationCenter's notifications between threads to update badge count

class ThreadViewController: UIViewController {

	private let tableView: UITableView = UITableView()
	private let textInputField: UITextField = UITextField()
	private let sendButton: UIButton = UIButton()
	private let messageModel: MessageModel
	
	var senderIndex: Int = 0 {
		didSet {
			title = "Thread \(senderIndex)"
		}
	}
	
	init(model: MessageModel) {
		messageModel = model
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor.whiteColor()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		textInputField.translatesAutoresizingMaskIntoConstraints = false
		sendButton.translatesAutoresizingMaskIntoConstraints = false
		
		sendButton.addTarget(self, action: #selector(sendButtonPressed), forControlEvents: .TouchUpInside)
    }
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	func sendButtonPressed() {
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ThreadViewController: UITextFieldDelegate {
	
	func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
		return true
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}