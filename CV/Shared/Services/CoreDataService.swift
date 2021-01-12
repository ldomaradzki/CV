//
//  CoreDataService.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import CoreData

class CoreDataService {
    private let container: NSPersistentContainer
    
    init(container: NSPersistentContainer) {
        self.container = container
    }
    
    /// Main-thread context
    var mainContext: NSManagedObjectContext {
        container.viewContext
    }
    
    func batchInsert<T: NSManagedObject>(count: Int, handler: @escaping (Int, T) -> Void) {
        var index = 0
        
        let batchInsertRequest = NSBatchInsertRequest(entity: T.entity(), managedObjectHandler: { newObject -> Bool in
            guard let newObject = newObject as? T,
                  index < count else { return true }
            
            handler(index, newObject)
            index += 1
            
            return false
        })
        
        do {
            try mainContext.execute(batchInsertRequest)
        } catch let error {
            print(error)
        }
    }
    
    /// Creates persistent container and returns with completion block
    static func createPersistentContainer(completion: @escaping (NSPersistentContainer) -> ()) {
        let container = NSPersistentContainer(name: "CV")
        container.loadPersistentStores(completionHandler: { _, error in
            guard error == nil else {
                fatalError("Failed to load store: \(error!)")
            }
            
            DispatchQueue.main.async { completion(container) }
        })
    }
}
