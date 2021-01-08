//
//  MenuRow.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import UIKit

enum MenuRow: Int, CaseIterable {
    case about
    case skills
    case experience
    case education
    
    func asString() -> String {
        switch self {
            case .about: return "About me"
            case .skills: return "My skills"
            case .experience: return "Work\nexperience"
            case .education: return "Education"
        }
    }
    
    func asIcon() -> UIImage {
        switch self {
        case .about: return UIImage(systemName: "person")!
            case .skills: return UIImage(systemName: "wand.and.stars")!
            case .experience: return UIImage(systemName: "desktopcomputer")!
            case .education: return UIImage(systemName: "rosette")!
        }
    }
}
