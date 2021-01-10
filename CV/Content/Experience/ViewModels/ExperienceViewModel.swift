//
//  ExperienceViewModel.swift
//  CV
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation

class ExperienceViewModel {
    private var dataProvider: DataProvider
    
    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }
    
    func fetchWorks(completion: ([Work]) -> Void) {
        dataProvider.fetchAllWorks { works in
            completion(works)
        }
    }
}
