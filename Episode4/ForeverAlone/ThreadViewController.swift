//
//  ThreadViewController.swift
//  ForeverAlone
//
//  Created by Patryk Adamkiewicz on 28/11/16.
//  Copyright © 2016 Patryk Adamkiewicz. All rights reserved.
//

import UIKit

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
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(newMessages), name: "MessageSent", object: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor.whiteColor()
		tableView.delegate = self
		tableView.dataSource = self

		textInputField.backgroundColor = UIColor.lightGrayColor()
		textInputField.delegate = self

		sendButton.addTarget(self, action: #selector(sendButtonPressed), forControlEvents: .TouchUpInside)
		sendButton.backgroundColor = UIColor.blackColor()

		tableView.translatesAutoresizingMaskIntoConstraints = false
		textInputField.translatesAutoresizingMaskIntoConstraints = false
		sendButton.translatesAutoresizingMaskIntoConstraints = false

		view.addSubview(tableView)
		view.addSubview(textInputField)
		view.addSubview(sendButton)

		let views = ["tv": tableView, "input": textInputField, "button": sendButton]
		view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[tv]|", options: [], metrics: nil, views: views))
		view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[input]-20-[button(30)]-20-|", options: [], metrics: nil, views: views))
		view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[input(40)][tv]|", options: [], metrics: nil, views: views))
		view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[button(40)][tv]|", options: [], metrics: nil, views: views))
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		badgeCount = 0
		tabBarItem.badgeValue = nil
		tableView.reloadData()
	}

	func sendButtonPressed() {
		if let text = textInputField.text where text != "" {
			messageModel.addNewMessage(text, sender: senderIndex)
			textInputField.text = nil
			tableView.reloadData()
			NSNotificationCenter.defaultCenter().postNotificationName("MessageSent", object: nil)
		}
	}

	private var badgeCount: Int = 0
	func newMessages() {
		if !isViewLoaded() {
			badgeCount += 1
			tabBarItem.badgeValue = "\(badgeCount)"
		}
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

extension ThreadViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return messageModel.numberOfMessages()
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell: UITableViewCell
		if let dequeued = tableView.dequeueReusableCellWithIdentifier("Identifier") {
			cell = dequeued
		} else {
			cell = UITableViewCell(style: .Default, reuseIdentifier: "Identifier")
		}
		cell.textLabel?.text = messageModel.messageAtIndex(indexPath.row)

		switch messageModel.senderForMessageAtIndex(indexPath.row) {
		case let index where index == senderIndex:
			cell.contentView.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.4)
		default:
			cell.contentView.backgroundColor = UIColor.yellowColor().colorWithAlphaComponent(0.4)
		}
		return cell
	}
}
