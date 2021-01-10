//
//  AppContext+DataProvider.swift
//  CV
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation

extension AppContext: DataProvider {
    func fetchAllWorks() -> [Work] {
        let request = Work.sortedFetchRequest
        request.returnsObjectsAsFaults = false
        
        do {
            return try mainContext.fetch(request)
        } catch let error {
            print(error)
        }
        
        return []
    }
}
