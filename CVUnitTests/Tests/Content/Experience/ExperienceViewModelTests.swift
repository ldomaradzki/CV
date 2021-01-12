//
//  ExperienceViewModelTests.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 12/01/2021.
//

import Foundation
import XCTest
@testable import CV

class ExperienceViewModelTests: XCTestCase {
    func testViewModelValues() {
        let dataProvider = MockDataProvider()
        let viewModel = ExperienceViewModel(dataProvider: dataProvider)
        
        XCTAssertEqual(viewModel.yearsOfExperienceValue, "7.0")
        XCTAssertEqual(viewModel.skillsValue, "4+")
    }
}
