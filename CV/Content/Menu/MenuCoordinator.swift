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
    
    private let menuViewModel = MenuViewModel()
    weak var delegate: MenuDelegate?
    
    init(appContext: Context, container: DisplayContainer) {
        self.appContext = appContext
        self.container = container
        
        menuViewModel.delegate = self
    }
    
    func start() {
        let menuViewController = MenuViewController()
        menuViewController.setup(menuViewModel)
        container.display(menuViewController)
    }
}

extension MenuCoordinator: MenuDelegate {
    func didSelect(menu: MenuRow) {
        delegate?.didSelect(menu: menu)
    }
}
