//
//  ExperienceViewController.swift
//  CV
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation
import UIKit

class ExperienceViewController: UIViewController {
    func setup(_ viewModel: ExperienceViewModel) {
        viewModel.fetchWorks { works in
            print(works)
            // setup all pages
        }
    }
}
