//
//  howIsThis.swift
//  XO-game
//
//  Created by Elizaveta Sidorenkova on 20.01.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation

final class whoIsThis {
    
    static let shared = whoIsThis()
    
    var whoIs: Computer = .first
}
