//
//  MenuItemViewModelTests.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation
import XCTest
@testable import CV

class MenuItemViewModelTests: XCTestCase {
    func testMenuText() {
        let viewModel = MenuItemViewModel(0)
        XCTAssertEqual(viewModel.labelText, "About me")
    }
}
