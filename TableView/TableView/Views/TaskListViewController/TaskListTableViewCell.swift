//
//  TaskListTableViewCell.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 14/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    static let identifier = "cellId"

    var task: Task? {
        didSet {
            nameLabel.text = task?.name ?? ""
            dateLabel.text = task?.dateString() ?? ""
        }
    }

}
