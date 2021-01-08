//
//  MenuItemViewModel.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import UIKit

struct MenuItemViewModel {
    private let menuRow: MenuRow!
    
    init(_ row: Int) {
        menuRow = MenuRow(rawValue: row)
    }
    
    var labelText: String {
        menuRow.asString()
    }
    
    var iconImage: UIImage {
        menuRow.asIcon().withRenderingMode(.alwaysTemplate)
    }
}

