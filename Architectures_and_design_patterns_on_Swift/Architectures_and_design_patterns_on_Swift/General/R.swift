//
//  R.swift
//  Architectures_and_design_patterns_on_Swift
//
//  Created by LACKY on 25.12.2021.
//

import UIKit

enum R {
    
    enum Storyboard {
    static let Main: UIStoryboard = .init(name: "Main", bundle: nil)
    static let play: UIStoryboard = .init(name: "play", bundle: nil)
    static let results: UIStoryboard = .init(name: "results", bundle: nil)
    static let settings: UIStoryboard = .init(name: "settings", bundle: nil)
    static let addQuestion: UIStoryboard = .init(name: "addQuestion", bundle: nil)
    }
    
    enum Nib {
        static let results: UINib = .init(nibName: "rusultsCellTableViewCell", bundle: nil)
    }
    
    enum Cell {
        static let results: String = "resultsCell"
    }
    
}
