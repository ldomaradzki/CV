//
//  AppContext.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation

protocol Context: CoreDataProvider { }

class AppContext: Context {
    let coreDataService = CoreDataService()
}
