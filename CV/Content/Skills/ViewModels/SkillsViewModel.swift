//
//  SkillsViewModel.swift
//  CV
//
//  Created by Lukasz Domaradzki on 11/01/2021.
//

import Foundation

struct SkillsViewModel {
    private let provider: DataProvider
    
    init(provider: DataProvider) {
        self.provider = provider
    }
    
    var allSkills: [String] {
        let results = provider.fetchAllWorks().reduce(into: []) { (result, work) in
            result.append(contentsOf: work.skills)
        }
        return results.unique
    }
}
