//
//  RootCoordinator.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation

class RootCoordinator: AppCoordinator {
    var appContext: Context
    var childCoordinators: [Coordinator] = []
    var displayContainer: DisplayContainer?
    
    init(container: DisplayContainer?, appContext: Context) {
        self.appContext = appContext
        self.displayContainer = container
    }
    
    func start() {
        let splitViewContainer = SplitViewController()
        displayContainer?.display(splitViewContainer)
        
        let menu = MenuCoordinator(appContext: appContext, container: splitViewContainer.primaryDisplay)
        menu.start()
        childCoordinators.append(menu)
    }
}
