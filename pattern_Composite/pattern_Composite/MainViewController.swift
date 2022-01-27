//
//  ViewController.swift
//  pattern_Composite
//
//  Created by LACKY on 24.01.2022.
//

import UIKit

class MainViewController: UITableViewController {

    @IBOutlet weak var addButton: UIButton!
    
    var tasks: [CompositeObjectProtocol] = []

    let child = UIViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
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
            self.tasks.append(RootFolder(name: answerName.text ?? "No name", description: answerDesc.text ?? {
                let taskNames = self.tasks.compactMap {$0.description}.joined(separator: ",")
                return "tasks \(taskNames)"
            }()))
            print("Appending folder \(answerName.text ?? "empty name")")
            self.tableView.reloadData()
        }
        textController.addAction(submitAction)
        present(textController, animated: true)
    }

    @IBAction func add_Button(_ sender: Any) {
        addFolder()
    }
}


extension UIViewController {

    func configureSubViewController(childController: UIViewController, onView: UIView?) {
        var holderView = self.view
        if let onView = onView {
            holderView = onView
        }
        addChild(childController)
        holderView?.addSubview(childController.view)
        constrainViewEqual(holderView: holderView!, view: childController.view)
        childController.didMove(toParent: self)
    }


    func constrainViewEqual(holderView: UIView, view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        //pin 100 points from the top of the super
        let pinTop = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal,
                                    toItem: holderView, attribute: .top, multiplier: 1.0, constant: 0)
        let pinBottom = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal,
                                       toItem: holderView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let pinLeft = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal,
                                     toItem: holderView, attribute: .left, multiplier: 1.0, constant: 0)
        let pinRight = NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal,
                                      toItem: holderView, attribute: .right, multiplier: 1.0, constant: 0)

        holderView.addConstraints([pinTop, pinBottom, pinLeft, pinRight])
    }
}
