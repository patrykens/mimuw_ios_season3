//
//  Int+Extensions.swift
//  Coelho
//
//  Created by Dev on 24/10/2016.
//  Copyright © 2016 asdf. All rights reserved.
//

import Foundation

extension Int {
	static func random(min min: Int, max: Int) -> Int {
		return Int(arc4random_uniform(UInt32(max-min)) + UInt32(min))
	}

	func times(block block: () -> Void ) {
		for _ in 0..<self {
			block()
		}
	}
}