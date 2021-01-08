//
//  CoreDataProvider.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import CoreData

protocol CoreDataProvider {
    var persistentContainer: NSPersistentContainer { get }
    
    func saveContext()
}
