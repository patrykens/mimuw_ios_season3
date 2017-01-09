//
//  UIColor+Extensions.swift
//  Animations
//
//  Created by Dev on 09/01/2017.
//  Copyright © 2017 daftmobile. All rights reserved.
//

import UIKit

extension UIColor {
	class func randomColor() -> UIColor {
		return UIColor.init(colorLiteralRed: Float(Int.random(min: 0, max: 255)) / Float(255),
		                    green: Float(Int.random(min: 0, max: 255)) / Float(255),
		                    blue: Float(Int.random(min: 0, max: 255)) / Float(255), alpha: 1)
	}
}