//
//  Computer.swift
//  XO-game
//
//  Created by Elizaveta Sidorenkova on 20.01.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation

public enum Computer: CaseIterable {
    case first
    //case second
    case computer
    
    var next: Computer {
        switch self {
        case .first: return .computer
        case .computer: return .first
        }
    }
    
    var markViewPrototype: MarkView {
        switch self {
        case .first: return XView()
        case .computer: return OView()
        }
    }
    
}
