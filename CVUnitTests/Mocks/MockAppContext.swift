//
//  MockAppContext.swift
//  CVUnitTests
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import CoreData
@testable import CV

class MockAppContext: Context {
    var mainContext: NSManagedObjectContext = .init(concurrencyType: .mainQueueConcurrencyType)
    
    func batchInsert<T>(count: Int, handler: @escaping (Int, T) -> Void) where T : NSManagedObject {
        
    }
    
    func fetchAllWorks() -> [Work] {
        []
    }
    
    func data(from file: URL) -> Data? {
        nil
    }
    
    func fetchRemoteWorkData(completion: @escaping (Result<[WorkRemote], Error>) -> Void) {
        
    }
    
    
}
