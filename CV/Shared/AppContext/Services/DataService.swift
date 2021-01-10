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
    
    let provider: FileProvider & CoreDataProvider
    
    init(provider: FileProvider & CoreDataProvider) {
        self.provider = provider
    }
    
    func insertInitialData() {
        guard let url = Bundle.main.url(forResource: "sample_Work", withExtension: "json"),
              let data = provider.data(from: url) else {
            return
        }
        
        var worksRemote: [WorkRemote] = []
        
        do {
            worksRemote = try decoder.decode(Array<WorkRemote>.self, from: data)
        } catch let error {
            print(error)
        }
        
        guard !worksRemote.isEmpty else { return }
        
        provider.batchInsert(count: worksRemote.count) { (index, work: Work) in
            work.map(from: worksRemote[index])
        }
    }
}
