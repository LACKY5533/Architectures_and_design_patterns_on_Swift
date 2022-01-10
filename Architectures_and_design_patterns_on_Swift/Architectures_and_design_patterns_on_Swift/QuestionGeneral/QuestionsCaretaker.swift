//
//  QuestionsCaretaker.swift
//  Architectures_and_design_patterns_on_Swift
//
//  Created by LACKY on 06.01.2022.
//

import Foundation

final class QuestionsCaretaker {
     
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
     
    private let key = "questions"
     
    func save(question: [Question]) {
        do {
            let data = try self.encoder.encode(question)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
     
    func retrieveQuestion() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
