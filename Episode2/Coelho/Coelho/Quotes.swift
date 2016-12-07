//
//  Fortune.swift
//  Coelho
//
//  Created by Dev on 24/10/2016.
//  Copyright © 2016 asdf. All rights reserved.
//

import Foundation

struct Quotes {
	private var quotes: [String]

	init() {
		guard let path = NSBundle.mainBundle().pathForResource("Coelho", ofType: ".plist") else { fatalError("File does not exist") }
		guard let arrayFromFile = NSArray(contentsOfFile: path) else { fatalError("Error parsing file to NSArray") }

		quotes = arrayFromFile as! [String]
	}

	func randomQuote() -> String {
		return quotes[Int.random(min: 0, max: quotes.count - 1)]
	}

	mutating func addNewQuote(newQuote: String) {
		quotes.append(newQuote)

		let quotesNSArray = NSArray(array: quotes)
		let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0].stringByAppendingString("/asdf.plist")
		quotesNSArray.writeToFile(path, atomically: true)
	}
}
