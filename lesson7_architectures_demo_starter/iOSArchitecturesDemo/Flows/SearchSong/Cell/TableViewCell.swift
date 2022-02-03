//
//  TableViewCell.swift
//  iOSArchitecturesDemo
//
//  Created by LACKY on 31.01.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

struct SongModel {
    let title: String
    let subtitle: String?
    let rating: String?
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!

    func configure(with cellModel: SongCellModel) {
            self.titleLabel.text = cellModel.title
            self.subtitleLabel.text = cellModel.subtitle
            self.ratingLabel.text = cellModel.rating
        }
    
}
