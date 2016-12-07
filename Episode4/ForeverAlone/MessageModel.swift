//
//  ThreadModel.swift
//  ForeverAlone
//
//  Created by Patryk Adamkiewicz on 28/11/16.
//  Copyright © 2016 Patryk Adamkiewicz. All rights reserved.
//

import UIKit

class MessageModel {
	private var messages: [(Int, String)] = []

	func numberOfMessages() -> Int {
		return messages.count
	}

	func messageAtIndex(index: Int) -> String {
		return messages[index].1
	}

	func senderForMessageAtIndex(index: Int) -> Int {
		return messages[index].0
	}

	func addNewMessage(message: String, sender: Int) {
		messages.append((sender, message))
	}
}