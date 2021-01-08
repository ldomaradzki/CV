//
//  MenuCoordinatorTests.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import XCTest
@testable import CV

class MenuCoordinatorTests: XCTestCase {
    func testInitilizingViewController() throws {
        let mockContainer = MockDisplayContainer()
        let coordinator = MenuCoordinator(appContext: MockAppContext(), container: mockContainer)
        
        XCTAssertNil(mockContainer.displayedViewController)
        coordinator.start()
        XCTAssertNotNil(mockContainer.displayedViewController)
    }
}
