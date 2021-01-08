//
//  DisplayContainer.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import UIKit

protocol DisplayContainer {
    func display(_ viewController: UIViewController)
}

extension UIWindow: DisplayContainer {
    func display(_ viewController: UIViewController) {
        rootViewController = viewController
        makeKeyAndVisible()
    }
}
