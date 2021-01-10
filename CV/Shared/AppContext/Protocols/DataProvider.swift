//
//  DataProvider.swift
//  CV
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation

protocol DataProvider {
    func fetchAllWorks() -> [Work]
}
