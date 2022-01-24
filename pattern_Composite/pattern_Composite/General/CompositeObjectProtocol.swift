//
//  CompositeObjectProtocol.swift
//  pattern_Composite
//
//  Created by LACKY on 24.01.2022.
//

import Foundation
import UIKit

protocol CompositeObjectProtocol {
    var name: UILabel? { get }
    var count: UILabel? { get }
    
//    var button = UIButton
    
    var subviews: [UIViewController] { get }
    
    func addSubview(_ subview: UIViewController)
    
}
