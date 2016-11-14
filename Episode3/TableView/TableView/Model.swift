 //
//  Model.swift
//  TableView
//
//  Created by Dev on 14/11/2016.
//  Copyright © 2016 daftmobile. All rights reserved.
//

import UIKit

struct Model {
	private var people: [[String : String]]

	init() {
		guard let path = NSBundle.mainBundle().pathForResource("People", ofType: ".plist") else { fatalError("File does not exist") }
		guard let arrayFromFile = NSArray(contentsOfFile: path) else { fatalError("Error parsing file to NSArray") }

		people = arrayFromFile as! [[String : String]]
	}

	func peopleCount() -> Int {
		return people.count
	}

	func avatarAtIndex(index: Int) -> String? {
		return people[index]["avatar"]
	}

	func nameAtIndex(index: Int) -> String? {
		return people[index]["name"]
	}

	func descriptionAtIndex(index: Int) -> String? {
		return people[index]["description"]
	}
}