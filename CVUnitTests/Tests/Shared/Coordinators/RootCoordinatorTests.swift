//
//  RootCoordinatorTests.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import XCTest
@testable import CV

class RootCoordinatorTests: XCTestCase {
    func testInitilizingRootViewController() throws {
        let mockContainer = MockDisplayContainer()
        let coordinator = RootCoordinator(container: mockContainer, appContext: MockAppContext())
        
        XCTAssertNil(mockContainer.displayedViewController)
        coordinator.start()
        XCTAssertNotNil(mockContainer.displayedViewController)
    }
}