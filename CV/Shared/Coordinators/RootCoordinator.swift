//
//  RootCoordinator.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import UIKit

class RootCoordinator: AppCoordinator {
    var appContext = AppContext()
    var childCoordinators: [Coordinator] = []
    var displayContainer: DisplayContainer?
    
    init(window: UIWindow?) {
        self.displayContainer = window
    }
    
    func start() {
        displayContainer?.display(ViewController())
    }
}
