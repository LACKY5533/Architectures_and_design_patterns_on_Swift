//
//  GameShared.swift
//  Architectures_and_design_patterns_on_Swift
//
//  Created by LACKY on 30.12.2021.
//

import Foundation

final class Game {
    
    static let shared = Game()
    private(set) var results: [Results] {
        didSet {
            resultCaretake.save(results: self.results)
        }
    }
    private let resultCaretake = ResultsCaretaker()
    
    private init() {
        self.results = self.resultCaretake.retrieveResults()
    }
    
    func addResults(_ results: Results) {
        self.results.append(results)
    }
    
    func clearResults() {
        self.results = []
    }
    
    var gameSession: GameSession?
    
}
