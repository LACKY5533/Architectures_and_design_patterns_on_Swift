//
//  LogAction.swift
//  XO-game
//
//  Created by LACKY on 17.01.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation

public enum LogAction {
    
    case playerInput(player: Computer, position: GameboardPosition)
    
    case gameFinished(winner: Computer?)
    
    case restartGame
    
}

public func Log(_ action: LogAction) {
    let command = LogCommand(action: action)
    LoggerInvoker.shared.addLogCommand(command)
}
