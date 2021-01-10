//
//  AppContext+DataProvider.swift
//  CV
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation

extension AppContext: DataProvider {
    func fetchAllWorks(completion: ([Work]) -> Void) {
        let request = Work.sortedFetchRequest
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try mainContext.fetch(request)
            completion(result)
        } catch let error {
            print(error)
        }
    }
}
