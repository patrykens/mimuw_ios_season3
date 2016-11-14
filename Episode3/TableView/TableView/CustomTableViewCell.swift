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

		let avatarLeft = NSLayoutConstraint(item: avatar,
		                                    attribute: .Left,
		                                    relatedBy: .Equal,
		                                    toItem: contentView,
		                                    attribute: .Left,
		                                    multiplier: 1.0,
		                                    constant: 20.0)

		contentView.addConstraints([avatarWidth, avatarRatio, avatarLeft])
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
