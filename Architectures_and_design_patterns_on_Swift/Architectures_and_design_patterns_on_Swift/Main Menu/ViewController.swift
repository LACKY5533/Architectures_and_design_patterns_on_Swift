//
//  ViewController.swift
//  Architectures_and_design_patterns_on_Swift
//
//  Created by LACKY on 25.12.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func play_Button(_ sender: UIButton!) {
        let playViewController = R.Storyboard.play.instantiateInitialViewController()
        playViewController?.modalPresentationStyle = .fullScreen
        self.present(playViewController!, animated: true)
    }
    
    @IBAction func results_Button(_ sender: Any) {
        let resultsViewController = R.Storyboard.results.instantiateInitialViewController()
        resultsViewController?.modalPresentationStyle = .fullScreen
        self.present(resultsViewController!, animated: true)
    }
    
    @IBAction func setting_Button(_ sender: Any) {
        let settingsViewController = R.Storyboard.settings.instantiateInitialViewController()
        settingsViewController?.modalPresentationStyle = .fullScreen
        self.present(settingsViewController!, animated: true)
    }
}

