//
//  GameViewController.swift
//  XO-game
//
//  Created by Evgeny Kireev on 25/02/2019.
//  Copyright © 2019 plasmon. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var gameboardView: GameboardView!
    @IBOutlet var firstPlayerTurnLabel: UILabel!
    @IBOutlet var secondPlayerTurnLabel: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var restartButton: UIButton!
    
    private let gameboard = Gameboard()
    private var currentState: GameState! {
        didSet {
            self.currentState.begin()
        }
    }
    
    private lazy var referee = Referee(gameboard: self.gameboard)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goToFirstState()
        // проблема - ожидание нажатия + реализация цикла
        
        gameboardView.onSelectPosition = { [weak self] position in
            guard let self = self else { return }
            
        if whoIsThis.shared.whoIs == .computer {
            let randomRow = Int.random(in: 0...2)
            let randomColumn = Int.random(in: 0...2)
            var position = GameboardPosition(column: randomColumn, row: randomRow)
                
                self.currentState.addMark(at: position)
                if self.currentState.isCompleted {
                    self.goToNextState()
                }
            
        } else {
//        gameboardView.onSelectPosition = { [weak self] position in
//            guard let self = self else { return }
            
            self.currentState.addMark(at: position)
            if self.currentState.isCompleted {
                self.goToNextState()
            }
        }
    }
        
    }
    
    private func goToFirstState() {
        // первый игрок
        //let player = Player.first
        
        let player = Computer.first
        self.currentState = ComputerInputState(computer: player,
                                             markViewPrototype: player.markViewPrototype,
                                             gameViewController: self,
                                             gameboard: gameboard,
                                             gameboardView: gameboardView)
    }

    private func goToNextState() {
        if let winner = self.referee.determineWinner() {
            self.currentState = GameEndedState(winner: winner, gameViewController: self)
            return
        }
        // смена игрока и состояния
//        if let playerInputState = currentState as? PlayerInputState {
//
//            // смена игрока
//            let player = playerInputState.player.next
//
//            self.currentState = PlayerInputState(player: player,
//                                                 markViewPrototype: player.markViewPrototype,
//                                                 gameViewController: self,
//                                                 gameboard: gameboard,
//                                                 gameboardView: gameboardView)
//        }
        
        
        if let playerInputState = currentState as? ComputerInputState {
            
            // смена игрока
            let player = playerInputState.computer.next
            if whoIsThis.shared.whoIs == .first {
                whoIsThis.shared.whoIs = .computer
            } else {
                whoIsThis.shared.whoIs = .first
            }
            
            self.currentState = ComputerInputState(computer: player,
                                                 markViewPrototype: player.markViewPrototype,
                                                 gameViewController: self,
                                                 gameboard: gameboard,
                                                 gameboardView: gameboardView)
        }
    }
    
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        Log(.restartGame)
    }
}
