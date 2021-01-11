//
//  Array+ext.swift
//  CV
//
//  Created by Lukasz Domaradzki on 11/01/2021.
//

import Foundation

extension Array where Element: Hashable {
    var unique: Self {
        Array(Set(self))
    }
}
