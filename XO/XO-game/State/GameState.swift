//
//  GameState.swift
//  XO-game
//
//  Created by LACKY on 17.01.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation

public protocol GameState {
    
    var isCompleted: Bool { get }
    
    func begin()
    
    func addMark(at position: GameboardPosition)
    
}


//public class PlayerInputState: GameState {
//
//    public private(set) var isCompleted = false
//
//    public let player: Player
//    private(set) weak var gameViewController: GameViewController?
//    private(set) weak var gameboard: Gameboard?
//    private(set) weak var gameboardView: GameboardView?
//
//    public let markViewPrototype: MarkView
//
//    init(player: Player, markViewPrototype: MarkView, gameViewController: GameViewController, gameboard: Gameboard, gameboardView: GameboardView) {
//        self.player = player
//        self.markViewPrototype = markViewPrototype
//        self.gameViewController = gameViewController
//        self.gameboard = gameboard
//        self.gameboardView = gameboardView
//    }
//
//    public func begin() {
//        switch self.player {
//        case .first:
//            self.gameViewController?.firstPlayerTurnLabel.isHidden = false
//            self.gameViewController?.secondPlayerTurnLabel.isHidden = true
//        case .second:
//            self.gameViewController?.firstPlayerTurnLabel.isHidden = true
//            self.gameViewController?.secondPlayerTurnLabel.isHidden = false
//        }
//        self.gameViewController?.winnerLabel.isHidden = true
//    }
//
//    public func addMark(at position: GameboardPosition) {
//
//
//
//        Log(.playerInput(player: self.player, position: position))
//
//        // проверка на свободную ячейку
//        guard let gameboardView = self.gameboardView
//            , gameboardView.canPlaceMarkView(at: position)
//            else { return }
//
//        self.gameboard?.setPlayer(self.player, at: position)
//        self.gameboardView?.placeMarkView(self.markViewPrototype.copy(), at: position)
//        self.isCompleted = true
//    }
//
//}

public class ComputerInputState: GameState {

    public private(set) var isCompleted = false
    
    public let computer: Computer
    private(set) weak var gameViewController: GameViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    
    public let markViewPrototype: MarkView
    
    init(computer: Computer, markViewPrototype: MarkView, gameViewController: GameViewController, gameboard: Gameboard, gameboardView: GameboardView) {
        self.computer = computer
        self.markViewPrototype = markViewPrototype
        self.gameViewController = gameViewController
        self.gameboard = gameboard
        self.gameboardView = gameboardView
    }
    
    // настройка UI
    public func begin() {
        switch self.computer {
        case .first:
            self.gameViewController?.firstPlayerTurnLabel.isHidden = false
            self.gameViewController?.secondPlayerTurnLabel.isHidden = true
        case .computer:
            self.gameViewController?.firstPlayerTurnLabel.isHidden = true
            self.gameViewController?.secondPlayerTurnLabel.isHidden = false
        }
        self.gameViewController?.winnerLabel.isHidden = true
    }
    
    // рандомно добавляет крестик или нолик
    public func addMark(at position: GameboardPosition) {
        Log(.playerInput(player: self.computer, position: position))
        
        guard let gameboardView = self.gameboardView
            , gameboardView.canPlaceMarkView(at: position)
            else { return }
        
        self.gameboard?.setPlayer(self.computer, at: position)
        self.gameboardView?.placeMarkView(self.markViewPrototype.copy(), at: position)
        self.isCompleted = true
    }

    
}
