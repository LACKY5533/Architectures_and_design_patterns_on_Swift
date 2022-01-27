//
//  Root.swift
//  pattern_Composite
//
//  Created by LACKY on 27.01.2022.
//

import Foundation
import UIKit

class RootFolder: CompositeObjectProtocol {

    var name: String

    var description: String

    var tasks: [CompositeObjectProtocol] = []

    init(name: String, description: String) {
        self.name = name
        self.description = description
    }

    func add() {
        print("opening \(description)")
        print("then opening files: ")
        self.tasks.forEach { $0.add() }
    }


}
