//
//  AboutViewController.swift
//  CV
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation
import UIKit

class AboutViewController: UIViewController {
    private let margin: CGFloat = 30.0
    private lazy var headerView = AboutHeaderView()
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20)
        label.textColor = .blackish
        label.textAlignment = .justified
        return label
    }()
    private lazy var textBubbleView = TextBubbleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headerView, constraints: [
            equal(\.topAnchor, constant: margin),
            equal(\.leftAnchor, constant: margin),
            equal(\.rightAnchor, constant: -margin),
            constant(\.heightAnchor, constant: 200)
        ])
        
        view.addSubview(descriptionLabel, constraints: [
            equal(\.leftAnchor, constant: 1.5*margin),
            constant(\.widthAnchor, constant: 400),
            equal(\.topAnchor, otherView: headerView, \.bottomAnchor, constant: 30)
        ])
        
        view.addSubview(textBubbleView, constraints: [
            equal(\.rightAnchor, constant: -1.5*margin),
            equal(\.topAnchor, otherView: headerView, \.bottomAnchor, constant: 50),
            equal(\.leftAnchor, otherView: descriptionLabel, \.rightAnchor, constant: 60),
        ])
    }
    
    func setup(_ viewModel: AboutViewModel) {
        descriptionLabel.text = viewModel.jobDescription
    }
}
