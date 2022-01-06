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
    
    private(set) var question: [Question] {
        didSet {
            questionCaretaker.save(question: self.question)
        }
    }
    private var questionCaretaker = QuestionsCaretaker()
    
    private init() {
        self.results = self.resultCaretake.retrieveResults()
        self.question = self.questionCaretaker.retrieveQuestion()
    }
    
    func addResults(_ results: Results) {
        self.results.append(results)
    }
    
    func clearResults() {
        self.results = []
    }
    
    func addQuestion(_ question: Question) {
        self.question.append(question)
    }
    
    func clearQuestion() {
        self.question = []
    }
    
    var gameSession: GameSession?
    
    var howIsGame: ModeGame = .serially
    
}
