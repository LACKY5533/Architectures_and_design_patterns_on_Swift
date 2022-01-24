//
//  CompositeClass.swift
//  pattern_Composite
//
//  Created by LACKY on 24.01.2022.
//

import Foundation
import UIKit

class CompositeClass: UIViewController ,CompositeObjectProtocol {
    var name: UILabel?
    var count: UILabel?
    
//    var button = UIButton
    
    var subviews: [UIViewController] = []
    
    override init(nibName: String?, bundle: Bundle?) {
        self.name!.text = nibName
        self.count!.text = "0"
        super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func addSubview(_ subview: UIViewController) {
        let detailViewController = CompositeClass(nibName: "DetailViewController", bundle: nil)
        subviews.append(detailViewController)
        
    }
}
