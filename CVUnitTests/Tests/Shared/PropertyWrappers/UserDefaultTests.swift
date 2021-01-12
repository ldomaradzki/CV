//
//  UserDefaultTests.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 12/01/2021.
//

import Foundation
import XCTest
@testable import CV

class UserDefaultTests: XCTestCase {
    static let key = "unit_tests_key"
    @UserDefault(key: key, defaultValue: false)
    var unitTestsKey: Bool
    
    override class func setUp() {
        UserDefaults.standard.setValue(nil, forKey: key)
    }
    
    func testUserDefaults() throws {
        let currentValue = UserDefaults.standard.object(forKey: UserDefaultTests.key) as? Bool
        
        XCTAssertNil(currentValue)
        
        unitTestsKey = true
        
        let newValue = try XCTUnwrap(UserDefaults.standard.object(forKey: UserDefaultTests.key) as? Bool)
        
        XCTAssertTrue(newValue)
    }
}
