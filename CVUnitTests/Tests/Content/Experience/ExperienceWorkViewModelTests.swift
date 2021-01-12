//
//  ExperienceWorkViewModelTests.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 12/01/2021.
//

import Foundation
import XCTest
@testable import CV

class ExperienceWorkViewModelTests: XCTestCase {
    func testYearsValue() {
        let dataProvider = MockDataProvider()
        let work = dataProvider.fetchAllWorks().first!
        let viewModel = ExperienceWorkViewModel(work: work)
        
        XCTAssertEqual(viewModel.dates, "Jan 1, 2010 - Jan 1, 2015")
    }
}
