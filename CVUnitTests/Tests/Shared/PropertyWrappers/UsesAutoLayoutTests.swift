//
//  UsesAutoLayoutTests.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation
import XCTest
@testable import CV

class UsesAutoLayoutTests: XCTestCase {
    @UsesAutoLayout var labelWithFlag = UILabel()
    var labelWithoutFlag = UILabel()
    
    func testPropertyFlagSet() {
        XCTAssertTrue(labelWithoutFlag.translatesAutoresizingMaskIntoConstraints)
        XCTAssertFalse(labelWithFlag.translatesAutoresizingMaskIntoConstraints)
    }
}
