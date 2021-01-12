//
//  NetworkDataService.swift
//  CV
//
//  Created by Lukasz Domaradzki on 12/01/2021.
//

import Foundation

class NetworkDataService {
    struct NetworkError: Error { }
    
    private let dataURL = URL(string: "https://gist.githubusercontent.com/dragonikpl/839428a736662215fd24826b216abc48/raw/9f457f35bfde84231558186cdaa921826b46a581/gistfile1.txt")!
    private let session = URLSession.shared
    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}

extension NetworkDataService: NetworkDataProvider {
    func fetchRemoteWorkData(completion: @escaping (Result<[WorkRemote], Error>) -> Void) {
        let task = session.dataTask(with: dataURL) { [weak self] (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, let decoded = try? self?.decoder.decode(Array<WorkRemote>.self, from: data) else {
                completion(.failure(NetworkError()))
                return
            }
            
            completion(.success(decoded))
        }
        task.resume()
    }
    
    
}
