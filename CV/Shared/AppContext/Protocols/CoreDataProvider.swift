//
//  CoreDataProvider.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import CoreData

protocol CoreDataProvider {
    var mainContext: NSManagedObjectContext { get }
    
    func batchInsert<T: NSManagedObject>(count: Int, handler: @escaping (Int, T) -> Void)
}
