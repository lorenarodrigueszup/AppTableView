//
//  TaskTableViewCell.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 14/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nomeTask: UILabel!
    
    @IBOutlet weak var dataTask: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
