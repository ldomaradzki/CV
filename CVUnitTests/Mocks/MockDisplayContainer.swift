//
//  MockDisplayContainer.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import UIKit
@testable import CV

class MockDisplayContainer: DisplayContainer {
    var displayedViewController: UIViewController?
    
    func display(_ viewController: UIViewController) {
        displayedViewController = viewController
    }
    
    func removeViewController() {
        displayedViewController = nil
    }
}
