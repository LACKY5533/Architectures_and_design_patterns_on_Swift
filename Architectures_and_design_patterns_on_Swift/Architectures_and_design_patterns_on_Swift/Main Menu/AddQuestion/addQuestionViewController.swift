//
//  addQuestionViewController.swift
//  Architectures_and_design_patterns_on_Swift
//
//  Created by LACKY on 10.01.2022.
//

import Foundation
import UIKit

class addQuestionViewController: UIViewController {
    
    @IBOutlet weak var question: UITextField!
    @IBOutlet weak var answer_1: UITextField!
    @IBOutlet weak var answer_2: UITextField!
    @IBOutlet weak var answer_3: UITextField!
    @IBOutlet weak var answer_4: UITextField!
    @IBOutlet weak var rightAnswer: UITextField!
    
    var newQ: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backToMenu_Button(_ sender: Any) {
        let mainViewController = R.Storyboard.Main.instantiateInitialViewController()
        mainViewController?.modalPresentationStyle = .fullScreen
        self.present(mainViewController!, animated: true)
    }
    
    @IBAction func addQuestionToMas_Button(_ sender: Any) {
        let question = Question(question: question.text!, answers: [answer_1.text!, answer_2.text!, answer_3.text!, answer_4.text!], rightAnswer: rightAnswer.text!)
        
        if question.answers.firstIndex(of: rightAnswer.text!) != nil {
            Game.shared.addQuestion(question)
        } else {
            let allertController = UIAlertController(
                title: "Ошибка!",
                message: "Правильный ответ не совпадает ни с одним ответом",
                preferredStyle: .alert)
            
            let action = UIAlertAction(
                title: "ОК",
                style: .cancel)
            
            allertController.addAction(action)
            self.present(allertController, animated: true)
        }
    }
}
