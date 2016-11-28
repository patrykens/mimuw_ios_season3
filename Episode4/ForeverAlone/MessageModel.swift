//
//  ThreadModel.swift
//  ForeverAlone
//
//  Created by Patryk Adamkiewicz on 28/11/16.
//  Copyright © 2016 Patryk Adamkiewicz. All rights reserved.
//

import UIKit

// Fix functions
// If enough time ...
// Implement delegation pattern to inform ViewControllers about model change

class MessageModel {
	private var messages: [(Int, String)] = []
	
	func numberOfMessages() -> Int {
		return 0
	}
	
	func messageAtIndex(index: Int) -> String {
		return "nope"
	}
	
	func senderForMessageAtIndex(index: Int) -> Int {
		return 0
	}
	
	func addNewMessage(message: String, sender: Int) {
		// append
	}
}
