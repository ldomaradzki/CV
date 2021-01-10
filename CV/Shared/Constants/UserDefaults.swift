//
//  UserDefaults.swift
//  CV
//
//  Created by Lukasz Domaradzki on 10/01/2021.
//

import Foundation

extension UserDefaults {

    @UserDefault(key: "initial_data_inserted", defaultValue: false)
    static var initialDataInserted: Bool
}
