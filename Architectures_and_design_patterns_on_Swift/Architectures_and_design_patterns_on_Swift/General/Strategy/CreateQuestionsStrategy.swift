//
//  CreateQuestionsStrategy.swift
//  Architectures_and_design_patterns_on_Swift
//
//  Created by LACKY on 06.01.2022.
//

import Foundation

protocol CreateQuestionsStrategy {
    func questionsStrategy() -> [Question]
}

final class SeriallyCreateQuestions: CreateQuestionsStrategy {
    func questionsStrategy() -> [Question] {
        let item: [Question] = Game.shared.question
        
        return item
    }
}

final class RandomlyCreateQuestions: CreateQuestionsStrategy {
    func questionsStrategy() -> [Question] {
        var item: [Question] = Game.shared.question
        
        item.shuffle()
        
        return item
    }
}
