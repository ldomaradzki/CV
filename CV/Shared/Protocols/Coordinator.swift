//
//  Coordinator.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }

    func start()
}

protocol AppCoordinator: Coordinator {
    var appContext: Context { get set }
}
