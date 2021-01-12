//
//  DataService.swift
//  CV
//
//  Created by Lukasz Domaradzki on 10/01/2021.
//

import Foundation

class DataService {
    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    let provider: NetworkDataProvider & CoreDataProvider
    
    init(provider: NetworkDataProvider & CoreDataProvider) {
        self.provider = provider
    }
    
    func insertInitialData() {
        provider.fetchRemoteWorkData { [weak self] result in
            guard case let .success(worksRemote) = result else {
                return
            }
            
            guard !worksRemote.isEmpty else { return }
            
            self?.provider.batchInsert(count: worksRemote.count) { (index, work: Work) in
                work.map(from: worksRemote[index])
            }
        }
    }
}
