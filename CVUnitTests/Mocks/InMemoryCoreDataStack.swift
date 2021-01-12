//
//  InMemoryCoreDataStack.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 12/01/2021.
//

import Foundation
import CoreData
@testable import CV

class InMemoryCoreDataStack {
    private let container: NSPersistentContainer
    
    init() {
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType

        container = NSPersistentContainer(name: "CV")
        container.persistentStoreDescriptions = [persistentStoreDescription]

        container.loadPersistentStores { _, error in
          if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
          }
        }
    }
    
    var mainContext: NSManagedObjectContext {
        container.viewContext
    }
}
