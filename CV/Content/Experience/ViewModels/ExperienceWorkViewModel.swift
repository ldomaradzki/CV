//
//  ExperienceWorkViewModel.swift
//  CV
//
//  Created by Lukasz Domaradzki on 10/01/2021.
//

import Foundation

struct ExperienceWorkViewModel {
    static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }
    
    let work: Work
    
    var dates: String {
        let startDate = ExperienceWorkViewModel.dateFormatter.string(from: work.startDate)
        let endDate = (work._endDate != nil) ? ExperienceWorkViewModel.dateFormatter.string(from: work._endDate!) : "current"
        return "\(startDate) - \(endDate)"
    }
}
