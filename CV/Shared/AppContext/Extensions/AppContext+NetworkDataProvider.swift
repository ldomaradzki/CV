//
//  AppContext+NetworkDataProvider.swift
//  CV
//
//  Created by Lukasz Domaradzki on 12/01/2021.
//

import Foundation

extension AppContext: NetworkDataProvider {
    func fetchRemoteWorkData(completion: @escaping (Result<[WorkRemote], Error>) -> Void) {
        networkDataService.fetchRemoteWorkData(completion: completion)
    }
}
