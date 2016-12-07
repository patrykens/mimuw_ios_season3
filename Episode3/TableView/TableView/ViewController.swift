//
//  ViewController.swift
//  TableView
//
//  Created by Dev on 14/11/2016.
//  Copyright © 2016 daftmobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let reuseIdentifier: String = "ReuseIdentifier"
	let tableView: UITableView = UITableView()
	let model: Model = Model()

	override func loadView() {
		view = tableView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self
		tableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 80
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
}

extension ViewController: UITableViewDataSource {
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return model.peopleCount()
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell: CustomTableViewCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as! CustomTableViewCell

		cell.avatar.image = UIImage(named: model.avatarAtIndex(indexPath.row)!)
		cell.descriptionLabel.text = model.descriptionAtIndex(indexPath.row)
		cell.nameLabel.text = model.nameAtIndex(indexPath.row)

		return cell
	}
}
