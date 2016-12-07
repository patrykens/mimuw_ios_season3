//
//  Controller.swift
//  Coelho
//
//  Created by Dev on 24/10/2016.
//  Copyright © 2016 asdf. All rights reserved.
//

import Foundation

protocol ControllerDelegate: class {
	func controllerDelegateReceivedQuote(quote: String)
}

class ViewModel {
	weak var delegate: ControllerDelegate?
	private var quoteModel = Quotes()

	func buttonPressed() {
		let newQuote = quoteModel.randomQuote()
		delegate?.controllerDelegateReceivedQuote(newQuote)
	}
}
