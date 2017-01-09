//
//  CustomTableViewCell.swift
//  Splash
//
//  Created by Dev on 12/12/2016.
//  Copyright © 2016 daftmobile. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

	let photo: UIImageView = UIImageView()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		photo.translatesAutoresizingMaskIntoConstraints = false
		photo.contentMode = UIViewContentMode.ScaleAspectFill
		photo.layer.cornerRadius = CGFloat(10)
		photo.layer.masksToBounds = true
		contentView.addSubview(photo)

		contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-4-[image(100)]", options: [], metrics: nil, views: ["image" : photo]))
		contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-4-[image(75)]-4-|", options: [], metrics: nil, views: ["image" : photo]))
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
