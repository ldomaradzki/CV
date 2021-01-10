//
//  FileProvider.swift
//  CV
//
//  Created by Lukasz Domaradzki on 10/01/2021.
//

import Foundation

protocol FileProvider {
    func data(from file: URL) -> Data?
}
