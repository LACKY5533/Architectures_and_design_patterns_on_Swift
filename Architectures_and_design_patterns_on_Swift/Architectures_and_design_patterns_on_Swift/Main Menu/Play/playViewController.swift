//
//  playViewController.swift
//  Architectures_and_design_patterns_on_Swift
//
//  Created by LACKY on 25.12.2021.
//

import UIKit

protocol playViewControllerDelegate: UIViewController {
    func didEndGame(withResults result: Int)
}

class playViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer_1: UILabel!
    @IBOutlet weak var answer_2: UILabel!
    @IBOutlet weak var answer_3: UILabel!
    @IBOutlet weak var answer_4: UILabel!
    
    weak var playDelegate: playViewControllerDelegate?
    
//    var modeGame: ModeGame = .serially
    
    let game = Game.shared
    
    var q: [Question] = []
    
    var n: Int = 0
    var i: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Game.shared.clearQuestion()
//        var question = Question(question: "Сколько длилась столетняя война?", answers: ["100", "97", "78", "116"], rightAnswer: "116")
//        Game.shared.addQuestion(question)
//        question = Question(question: "Какое животное приносит детей?", answers: ["Лиса", "Аист", "Заяц", "Черепаха"], rightAnswer: "Аист")
//        Game.shared.addQuestion(question)
//        question = Question(question: "Какуб часть тела также называют Атлант?", answers: ["головной мозг", "шестая пара рёбер", "шейный позвонок", "часть плеча"], rightAnswer: "шейный позвонок")
//        Game.shared.addQuestion(question)
//        question = Question(question: "Сколько морей омывает Балканский полуостров?", answers: ["3", "4", "5", "6"], rightAnswer: "6")
//        Game.shared.addQuestion(question)
//        question = Question(question: "Какую страну не пересекает экватор?", answers: ["Панама", "Кения", "Бразилия", "Индонезия"], rightAnswer: "Панама")
//        Game.shared.addQuestion(question)
        
        if Game.shared.modeGame == .serially {
            let strategySerially = SeriallyCreateQuestions()
            self.q = strategySerially.questionsStrategy()
        } else if Game.shared.modeGame == .randomly {
            let strategyRandomly = RandomlyCreateQuestions()
            self.q = strategyRandomly.questionsStrategy()
        }
        
//        self.q = Game.shared.question
        
        n = Game.shared.question.count
        i = 0
        
        questions()
        
        game.gameSession?.all += 1
    }
    
    func questions() {
        questionLabel.text = q[i].question
        answer_1.text = q[i].answers[0]
        answer_2.text = q[i].answers[1]
        answer_3.text = q[i].answers[2]
        answer_4.text = q[i].answers[3]
    }
    
    func checkAnswer(answer: String) {
        
        if answer == q[i].rightAnswer {
            self.isRightAnswer()
        }else {
            self.isFalseAnswer()
        }
    }
    
    func isRightAnswer() {
            
        i += 1
        if i == n {
            
            let score = i
            let result = Results(date: Date(), score: score)
            Game.shared.addResults(result)
            
            self.playDelegate?.didEndGame(withResults: score)
            
            let mainViewController = R.Storyboard.Main.instantiateInitialViewController()
            mainViewController?.modalPresentationStyle = .fullScreen
            self.present(mainViewController!, animated: true)
        
        } else {
            questions()
        }
    }
    
    func isFalseAnswer() {
        
        let score = i
        let result = Results(date: Date(), score: score)
        Game.shared.addResults(result)
        
        self.playDelegate?.didEndGame(withResults: score)
        
        let mainViewController = R.Storyboard.Main.instantiateInitialViewController()
        mainViewController?.modalPresentationStyle = .fullScreen
        self.present(mainViewController!, animated: true)
        
    }
    

    @IBAction func button_answer_1(_ sender: Any) {
        let answer1 = answer_1.text
        checkAnswer(answer: answer1!)
    }
    
    @IBAction func button_answer_2(_ sender: Any) {
        let answer2 = answer_2.text
        checkAnswer(answer: answer2!)
    }
    
    @IBAction func button_answer_3(_ sender: Any) {
        let answer3 = answer_3.text
        checkAnswer(answer: answer3!)
    }
    
    @IBAction func button_answer_4(_ sender: Any) {
        let answer4 = answer_4.text
        checkAnswer(answer: answer4!)
    }
    
}
