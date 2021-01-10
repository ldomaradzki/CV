//
//  Work.swift
//  CV
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation
import CoreData

@objc(Work)
final class Work: NSManagedObject {
    @NSManaged fileprivate(set) var companyName: String
    @NSManaged fileprivate(set) var startDate: Date
    @NSManaged private var endDate: Date?
    @NSManaged fileprivate(set) var lastPosition: String
    @NSManaged fileprivate(set) var positionDescription: String
    
    /// Returns actual endDate value, unwrapped from CoreData value
    /// Note: Optionality in CoreData is not the same as in Swift, even
    /// if I didn't add any value, Date was set to `2001-01-01 00:00:00 +0000`
    var _endDate: Date? {
        guard let endDate = endDate,
              endDate.timeIntervalSinceReferenceDate != 0 else {
            return nil
        }
        
        return endDate
    }
    
    func map(from workRemote: WorkRemote) {
        companyName = workRemote.companyName
        startDate = workRemote.startDate
        endDate = workRemote.endDate
        lastPosition = workRemote.lastPosition
        positionDescription = workRemote.positionDescription
    }
}

extension Work: Managed {
    static var defaultSortDescriptors: [NSSortDescriptor] {
        [NSSortDescriptor(key: #keyPath(startDate), ascending: false)]
    }
    
    static var entityName: String = "Work"
}
