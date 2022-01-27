//
//  SubViewController.swift
//  pattern_Composite
//
//  Created by LACKY on 27.01.2022.
//

import Foundation
import UIKit

class SubViewController: UITableViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var tasks: [CompositeObjectProtocol] = []
    
    let child = UIViewController()
    
        override func viewDidLoad() {
        super.viewDidLoad()
            tasks.forEach { $0.add() }
            tableView.delegate = self
            tableView.dataSource = self
            let nib = UINib(nibName: "TableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "Cell")
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.configureTask(with: tasks[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("connecting sub")
        let vc = storyboard!.instantiateViewController(withIdentifier: "SubVC") as! SubViewController
        configureSubViewController(childController: vc, onView: nil)
    }

    private func addFolder() {
        let textController = UIAlertController(title: "Enter folder name", message: nil, preferredStyle: .alert)
        textController.addTextField()
        textController.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned textController] _ in
            let answerName = textController.textFields![0]
            let answerDesc = textController.textFields![1]
            self.tasks.append(MainTask(name: answerName.text ?? "No name", description: answerDesc.text ?? "no description"))
            print("Appending folder \(answerName.text ?? "empty name")")
            self.tableView.reloadData()
        }
        textController.addAction(submitAction)
        present(textController, animated: true)
    }

    @IBAction func back_Button(_ sender: Any) {
        print("reversing child")
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    @IBAction func add_Button(_ sender: Any) {
        addFolder()
    }
}

