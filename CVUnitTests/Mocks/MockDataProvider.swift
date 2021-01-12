//
//  MockDataProvider.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 12/01/2021.
//

import Foundation
@testable import CV

struct MockDataProvider: DataProvider {
    private let stack = InMemoryCoreDataStack()
    
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    static let remotes = [
        WorkRemote(companyName: "MockA",
                   startDate: dateFormatter.date(from: "2010-01-01")!,
                   endDate: dateFormatter.date(from: "2015-01-01")!,
                   lastPosition: "Senior Position",
                   positionDescription: "Senior description",
                   skills: ["Work", "Hard"]),
        WorkRemote(companyName: "MockB",
                   startDate: dateFormatter.date(from: "2015-01-01")!,
                   endDate: dateFormatter.date(from: "2017-01-01")!,
                   lastPosition: "Super Senior Position",
                   positionDescription: "Senior description",
                   skills: ["Hardly", "Working"])
    ]
    
    func fetchAllWorks() -> [Work] {
        return MockDataProvider.remotes.map {
            let work = Work(context: stack.mainContext)
            work.map(from: $0)
            return work
        }
    }
}
