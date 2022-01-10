//
//  resultsViewController.swift
//  Architectures_and_design_patterns_on_Swift
//
//  Created by LACKY on 30.12.2021.
//

import Foundation
import UIKit

class resultsViewController: UITableViewController {
    
    var game = Game.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(R.Nib.results, forCellReuseIdentifier: R.Cell.results)
    }
    
    @IBAction func backToMain_Button(_ sender: Any) {
        let mainViewController = R.Storyboard.Main.instantiateInitialViewController()
        mainViewController?.modalPresentationStyle = .fullScreen
        self.present(mainViewController!, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return Game.shared.results.count
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: R.Cell.results, for: indexPath)
        
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? rusultsCellTableViewCell)?.configure(with: Game.shared.results[indexPath.row])
    }
}
