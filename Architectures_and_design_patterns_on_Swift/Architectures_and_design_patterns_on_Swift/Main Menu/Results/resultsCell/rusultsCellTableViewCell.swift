//
//  rusultsCellTableViewCell.swift
//  Architectures_and_design_patterns_on_Swift
//
//  Created by LACKY on 30.12.2021.
//

import UIKit

class rusultsCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLAbel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var game = Game.shared
    
    func configure(with item: Results) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateLAbel.text = dateFormatter.string(from: item.date)
        resultLabel.text = "\(item.score)"
    }
}
