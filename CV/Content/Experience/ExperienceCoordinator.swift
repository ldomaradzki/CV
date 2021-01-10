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
    
    private let viewModel: ExperienceViewModel
    
    init(appContext: Context, container: DisplayContainer) {
        self.appContext = appContext
        self.container = container
        viewModel = ExperienceViewModel(dataProvider: appContext)
    }
    
    func start() {
        let experienceViewController = ExperienceViewController()
        experienceViewController.setup(viewModel)
        container.display(experienceViewController)
    }
}
