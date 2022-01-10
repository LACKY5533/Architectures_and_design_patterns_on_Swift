//
//  settingsViewController.swift
//  Architectures_and_design_patterns_on_Swift
//
//  Created by LACKY on 06.01.2022.
//

import Foundation
import UIKit

class settingsViewController: UIViewController {
    @IBOutlet weak var modeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Change_Button(_ sender: Any) {
        if modeLabel.text == "Режим: последовательно" {
            modeLabel.text = "Режим: случайно"
            Game.shared.modeGame = .randomly
        } else {
            modeLabel.text = "Режим: последовательно"
            Game.shared.modeGame = .serially
        }
    }
    
    @IBAction func backToMenu_Button(_ sender: Any) {
        let mainViewController = R.Storyboard.Main.instantiateInitialViewController()
        mainViewController?.modalPresentationStyle = .fullScreen
        self.present(mainViewController!, animated: true)
    }
}
