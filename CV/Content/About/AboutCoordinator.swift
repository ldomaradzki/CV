//
//  AboutCoordinator.swift
//  CV
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation

class AboutCoordinator: AppCoordinator {
    var appContext: Context
    var childCoordinators: [Coordinator] = []
    var container: DisplayContainer
    
    private let viewModel = AboutViewModel()
    
    init(appContext: Context, container: DisplayContainer) {
        self.appContext = appContext
        self.container = container
    }
    
    func start() {
        let aboutViewController = AboutViewController()
        aboutViewController.setup(viewModel)
        container.display(aboutViewController)
    }
}
