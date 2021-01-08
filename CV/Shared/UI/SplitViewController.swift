//
//  SplitViewController.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import UIKit

class SplitViewController: UIViewController {
    lazy var primaryDisplay = { ChildVCContainer(side: .left, parent: self) }()
    lazy var secondaryDisplay = { ChildVCContainer(side: .right, parent: self) }()
    
    override func viewDidLoad() {
        super.viewDidLoad()   
    }
    
    override var prefersStatusBarHidden: Bool {
        true
    }
}
