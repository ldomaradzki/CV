//
//  MenuViewModelTests.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation
import XCTest
@testable import CV

class MenuViewModelTests: XCTestCase {
    func testTableNumberOfRows() {
        let viewModel = MenuViewModel()
        XCTAssertEqual(viewModel.tableView(UITableView(), numberOfRowsInSection: 0), MenuRow.allCases.count)
    }
    
    func testTableSelectionDelegation() {
        class MockMenuDelegate: MenuDelegate {
            var selectedMenu: MenuRow?
            func didSelect(menu: MenuRow) {
                selectedMenu = menu
            }
        }
        
        let viewModel = MenuViewModel()
        let mockDelegate = MockMenuDelegate()
        viewModel.delegate = mockDelegate
        
        XCTAssertNil(mockDelegate.selectedMenu)
        
        viewModel.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(mockDelegate.selectedMenu, .about)
    }
}
