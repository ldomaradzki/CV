//
//  ExperienceCoordinator.swift
//  CV
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation

class ExperienceCoordinator: AppCoordinator {
    var appContext: Context
    var childCoordinators: [Coordinator] = []
    var container: DisplayContainer
    
    init(appContext: Context, container: DisplayContainer) {
        self.appContext = appContext
        self.container = container
    }
    
    func start() {
        let viewModel = ExperienceViewModel(dataProvider: appContext)
        let experienceViewController = ExperienceViewController()
        experienceViewController.setup(viewModel)
        container.display(experienceViewController)
    }
}
