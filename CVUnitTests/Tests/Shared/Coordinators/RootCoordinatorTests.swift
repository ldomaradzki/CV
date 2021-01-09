//
//  RootCoordinatorTests.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import XCTest
@testable import CV

class RootCoordinatorTests: XCTestCase {
    func testInitilizingRootViewController() {
        let mockContainer = MockDisplayContainer()
        let coordinator = RootCoordinator(container: mockContainer, appContext: MockAppContext())
        
        XCTAssertNil(mockContainer.displayedViewController)
        XCTAssertTrue(coordinator.childCoordinators.isEmpty)
        
        coordinator.start()
        XCTAssertNotNil(mockContainer.displayedViewController)
        XCTAssertFalse(coordinator.childCoordinators.isEmpty)
    }
    
    func testContentSelection() throws {
        let mockContainer = MockDisplayContainer()
        let coordinator = RootCoordinator(container: mockContainer, appContext: MockAppContext())
        
        coordinator.start()
        
        let splitVC = try XCTUnwrap(mockContainer.displayedViewController as? SplitViewController)
        
        XCTAssertTrue(splitVC.primaryDisplay.viewController is MenuViewController)
        
        // initial selection
        XCTAssertTrue(splitVC.secondaryDisplay.viewController is AboutViewController)
        
        coordinator.didSelect(menu: .education)
        XCTAssertTrue(splitVC.secondaryDisplay.viewController is EducationViewController)
        
        coordinator.didSelect(menu: .experience)
        XCTAssertTrue(splitVC.secondaryDisplay.viewController is ExperienceViewController)
        
        coordinator.didSelect(menu: .skills)
        XCTAssertTrue(splitVC.secondaryDisplay.viewController is SkillsViewController)
        
        XCTAssertTrue(coordinator.childCoordinators.count == 2)
    }
}
