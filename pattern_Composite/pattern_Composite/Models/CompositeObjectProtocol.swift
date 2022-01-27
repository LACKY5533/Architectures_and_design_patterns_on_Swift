//
//  CompositeObjectProtocol.swift
//  pattern_Composite
//
//  Created by LACKY on 24.01.2022.
//

import Foundation
import UIKit

protocol CompositeObjectProtocol {
    var name: String { get }
    var description: String { get }
    
    func add()
    
}
