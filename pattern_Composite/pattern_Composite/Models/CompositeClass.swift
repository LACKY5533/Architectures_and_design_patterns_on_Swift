//
//  CompositeClass.swift
//  pattern_Composite
//
//  Created by LACKY on 24.01.2022.
//

import Foundation

class MainTask: CompositeObjectProtocol {


    var name: String

    var description: String


    init(name: String, description: String) {
        self.name = name
        self.description = description
    }

    func add() {

    }

}

class SubTask: CompositeObjectProtocol {

    var name: String

    var description: String


    init(name: String, description: String) {
        self.name = name
        self.description = description

    }

    func add() {

    }
}
