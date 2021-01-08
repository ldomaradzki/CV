//
//  UITableViewCell+ext.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import UIKit

extension UITableViewCell {
    static func reuseIdentifier() -> String {
        "\(self)"
    }
}
