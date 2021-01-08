//
//  AppContext+CoreDataProvider.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import CoreData

extension AppContext: CoreDataProvider {
    var persistentContainer: NSPersistentContainer {
        coreDataService.persistentContainer
    }
    
    func saveContext() {
        coreDataService.saveContext()
    }   
}
