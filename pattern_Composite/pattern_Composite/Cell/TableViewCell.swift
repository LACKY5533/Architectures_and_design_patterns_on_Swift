//
//  TableViewCell.swift
//  pattern_Composite
//
//  Created by LACKY on 27.01.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

        func configureTask(with task: CompositeObjectProtocol) {
            nameLabel.text = task.name
            descriptionLabel.text = task.description

        }
    
}
