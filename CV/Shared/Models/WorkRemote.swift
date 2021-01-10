//
//  WorkRemote.swift
//  CV
//
//  Created by Lukasz Domaradzki on 10/01/2021.
//

import Foundation

struct WorkRemote: Codable {
    let companyName: String
    let startDate: Date
    let endDate: Date?
    let lastPosition: String
    let positionDescription: String
}
