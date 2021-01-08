//
//  MenuCoordinator.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation

class MenuCoordinator: AppCoordinator {
    var appContext: Context
    var childCoordinators: [Coordinator] = []
    var container: DisplayContainer
    
    init(appContext: Context, container: DisplayContainer) {
        self.appContext = appContext
        self.container = container
    }
    
    func start() {
        container.display(MenuViewController())
    }
}