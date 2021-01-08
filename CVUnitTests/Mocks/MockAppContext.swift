//
//  MockAppContext.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import CoreData
@testable import CV

class MockAppContext: Context {
    
}

extension MockAppContext: CoreDataProvider {
    var persistentContainer: NSPersistentContainer {
        NSPersistentContainer()
    }
    
    func saveContext() {
        
    }
}
