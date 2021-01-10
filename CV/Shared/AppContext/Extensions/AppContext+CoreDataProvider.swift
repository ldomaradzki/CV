//
//  AppContext+CoreDataProvider.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import CoreData

extension AppContext: CoreDataProvider {
    func batchInsert<T>(count: Int, handler: @escaping (Int, T) -> Void) where T : NSManagedObject {
        coreDataService.batchInsert(count: count, handler: handler)
    }
    
    var mainContext: NSManagedObjectContext {
        coreDataService.mainContext
    }
}
