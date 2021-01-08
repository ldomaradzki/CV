//
//  MenuViewController.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    @UsesAutoLayout
    private var header = UIView()
    
    @UsesAutoLayout
    private var headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Curriculum\nVitae"
        label.numberOfLines = 0
        label.textColor = UIColor(rgb: 0x160E4D)
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(rgb: 0xFAFAFA)
        
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(header, constraints: [
            equal(\.topAnchor),
            equal(\.leftAnchor),
            equal(\.rightAnchor),
            constant(\.heightAnchor, constant: 150)
        ])
        
        header.addSubview(headerTitle, constraints: [
            equal(\.centerYAnchor),
            equal(\.centerXAnchor)
        ])
    }
}
