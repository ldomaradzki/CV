//
//  ArrayExtTests.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 12/01/2021.
//

import Foundation
import XCTest
@testable import CV

class ArrayExtTests: XCTestCase {
    func testUniqueness() {
        let array = ["a", "a", "b"]
        
        XCTAssertTrue(array.unique.count == 2)
    }
}
