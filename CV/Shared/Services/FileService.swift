//
//  FileService.swift
//  CV
//
//  Created by Lukasz Domaradzki on 10/01/2021.
//

import Foundation

/// Used for debugging before NetworkDataProvider
class FileService {
    let manager = FileManager.default
}

extension FileService: FileProvider {
    func data(from file: URL) -> Data? {
        manager.contents(atPath: file.path)
    }
}
