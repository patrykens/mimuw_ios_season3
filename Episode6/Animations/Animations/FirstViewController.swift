//
//  FirstViewController.swift
//  Animations
//
//  Created by Dev on 09/01/2017.
//  Copyright © 2017 daftmobile. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
		super.init(nibName: nil, bundle: nil)
		title = "First"
		view.backgroundColor = UIColor.whiteColor()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		let height = CGFloat(65)

		let button1 = newButton()
		button1.frame.origin.y = height
		button1.addTarget(self, action: #selector(randomXPosition(_:)), forControlEvents: .TouchUpInside)

		let button2 = newButton()
		button2.frame.origin.y = height * 2
		button2.addTarget(self, action: #selector(randomWidth(_:)), forControlEvents: .TouchUpInside)

		let button3 = newButton()
		button3.frame.origin.y = height * 3
		button3.addTarget(self, action: #selector(rotateTwice(_:)), forControlEvents: .TouchUpInside)

		let button4 = newButton()
		button4.frame.origin.y = height * 4
		button4.addTarget(self, action: #selector(rotateOnce(_:)), forControlEvents: .TouchUpInside)

		let button5 = newButton()
		button5.frame.origin.y = height * 5
		button5.addTarget(self, action: #selector(bounce(_:)), forControlEvents: .TouchUpInside)

		let button6 = newButton()
		button6.frame.origin.y = height * 6
		button6.addTarget(self, action: #selector(scaleNonStick(_:)), forControlEvents: .TouchUpInside)

		let button7 = newButton()
		button7.frame.origin.y = height * 7
		button7.addTarget(self, action: #selector(scaleStick(_:)), forControlEvents: .TouchUpInside)

		let button8 = newButton()
		button8.frame.origin.y = height * 8
		button8.addTarget(self, action: #selector(changeColor(_:)), forControlEvents: .TouchUpInside)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func newButton() -> UIButton {
		let button = UIButton(type: .Custom)
		button.backgroundColor = UIColor.randomColor()
		button.frame = CGRect(x: UIScreen.mainScreen().bounds.width * 0.5 - 40.0, y: 0, width: 80, height: 40)
		view.addSubview(button)
		return button
	}

	func newScrollButton() -> UIButton {
		let button = UIButton(type: .Custom)
		button.backgroundColor = UIColor.randomColor()
		button.frame = CGRect(x: 0, y: 5, width: 80, height: 40)
		return button
	}

	func randomXPosition(button: UIButton) {
		UIView.animateWithDuration(0.3) {
			button.frame.origin.x = CGFloat(Int.random(min: 40, max: 300))
		}
	}

	func randomWidth(button: UIButton) {
		UIView.animateWithDuration(0.3) {
			let width = CGFloat(Int.random(min: 80, max: 300))
			button.frame.size.width = width
			button.frame.origin.x = (UIScreen.mainScreen().bounds.width - width) / CGFloat(2)
		}
	}

	func rotateTwice(button: UIButton) {
		UIView.animateWithDuration(0.2, animations: {
//			button.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI), 0, 0, 1)
			button.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
			}) { (completed) in
				UIView.animateWithDuration(0.2, animations: {
//					button.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI * 2), 0, 0, 1)
					button.transform = CGAffineTransformMakeRotation(CGFloat(M_PI * 2))
				})
		}
	}

	func rotateOnce(button: UIButton) {
		let rotate = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		rotate.values = [0, M_PI, M_PI * 2]
		rotate.keyTimes = [0, 0.5, 1]
		rotate.duration = 0.5

		button.layer.addAnimation(rotate, forKey: nil)
	}

	func bounce(button: UIButton) {
		let bounce = CAKeyframeAnimation(keyPath: "transform.scale")
		bounce.values = [1, 1.2, 0.8, 1.1, 0.95, 1.02, 1]
		bounce.keyTimes = [0, 1.0/6.0, 2.0/6.0, 3.0/6.0, 4.0/6.0, 5.0/6.0, 6.0/6.0]
		bounce.duration = 0.8

		button.layer.addAnimation(bounce, forKey: nil)
	}

	func scaleNonStick(button: UIButton) {
		let scale = CABasicAnimation(keyPath: "transform.scale.x")
		scale.toValue = 2.5
		scale.duration = 0.5

		button.layer.addAnimation(scale, forKey: nil)
		button.layer.contentsScale = 2.5
	}

	func scaleStick(button: UIButton) {
		CATransaction.begin()
		CATransaction.setCompletionBlock {
			button.layer.transform = CATransform3DMakeScale(2.5, 1, 1)
		}

		CATransaction.setAnimationDuration(0.5)
		CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAAnimationLinear))

		let scaleAnimation = CASpringAnimation(keyPath: "transform.scale.x")
		scaleAnimation.toValue = 2.5
		scaleAnimation.fillMode = kCAFillModeForwards
		scaleAnimation.removedOnCompletion = false
		scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAAnimationLinear)
		scaleAnimation.duration = 5.5
		scaleAnimation.damping = 50
		scaleAnimation.stiffness = 1000
		scaleAnimation.mass = 10

		button.layer.addAnimation(scaleAnimation, forKey: nil)
		CATransaction.commit()
	}

	func changeColor(button: UIButton) {
		let frameDuration = 1.0/3.0

		UIView.animateKeyframesWithDuration(2, delay: 0, options: [], animations: {
			UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: frameDuration, animations: {
				button.backgroundColor = UIColor.randomColor()
			})
			UIView.addKeyframeWithRelativeStartTime(frameDuration, relativeDuration: frameDuration, animations: {
				button.backgroundColor = UIColor.randomColor()
			})
			UIView.addKeyframeWithRelativeStartTime(frameDuration * 2, relativeDuration: frameDuration, animations: {
				button.backgroundColor = UIColor.randomColor()
			})
		}, completion: nil)
	}
}

