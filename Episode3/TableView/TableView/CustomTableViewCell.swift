//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Dev on 14/11/2016.
//  Copyright © 2016 daftmobile. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

	let avatar: UIImageView = UIImageView()
	let nameLabel: UILabel = UILabel()
	let descriptionLabel: UILabel = UILabel()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		selectionStyle = .Default

		avatar.translatesAutoresizingMaskIntoConstraints = false
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

		nameLabel.numberOfLines = 0
		descriptionLabel.numberOfLines = 0

		contentView.addSubview(avatar)
		contentView.addSubview(nameLabel)
		contentView.addSubview(descriptionLabel)

		let avatarRatio = NSLayoutConstraint(item: avatar,
		                                     attribute: .Width,
		                                     relatedBy: .Equal,
		                                     toItem: avatar,
		                                     attribute: .Height,
		                                     multiplier: 1.0,
		                                     constant: 0.0)

		let avatarWidth = NSLayoutConstraint(item: avatar,
		                                     attribute: .Width,
		                                     relatedBy: .Equal,
		                                     toItem: contentView,
		                                     attribute: .Width,
		                                     multiplier: 0.0,
		                                     constant: 50.0)

		contentView.addConstraints([avatarWidth, avatarRatio])

		let views: [String: AnyObject] = ["avatar": avatar, "name": nameLabel, "desc": descriptionLabel]

		let con1 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[avatar]-20-[name]-20-|",
		                                                          options: [.AlignAllCenterY],
		                                                          metrics: nil,
		                                                          views: views)
		let con2 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-20-[avatar]-20-[desc]-20-|",
		                                                          options: [],
		                                                          metrics: nil,
		                                                          views: views)
		let con3 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[desc]-20-|",
		                                                          options: [],
		                                                          metrics: nil,
		                                                          views: views)

		contentView.addConstraints(con1)
		contentView.addConstraints(con2)
		contentView.addConstraints(con3)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
