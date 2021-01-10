//
//  AppContext.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import CoreData

protocol Context: CoreDataProvider, DataProvider, FileProvider { }

class AppContext: Context {
    let coreDataService: CoreDataService
    let fileService = FileService()
    var dataService: DataService?
    
    init(_ container: NSPersistentContainer) {
        coreDataService = CoreDataService(container: container)
        dataService = DataService(provider: self)
        
        if !UserDefaults.initialDataInserted {
            dataService?.insertInitialData()
            UserDefaults.initialDataInserted = true
        }
        
    }
}
