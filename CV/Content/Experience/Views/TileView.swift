//
//  TileView.swift
//  CV
//
//  Created by Lukasz Domaradzki on 10/01/2021.
//

import Foundation
import UIKit

class TileView: UIView {
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 82)
        label.textColor = .white
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        
        layer.cornerRadius = 30
        
        addSubview(valueLabel, constraints: [
            equal(\.centerYAnchor, constant: -10),
            equal(\.centerXAnchor)
        ])
        
        addSubview(titleLabel, constraints: [
            equal(\.topAnchor, otherView: valueLabel, \.bottomAnchor, constant: -10),
            equal(\.leftAnchor, constant: 10),
            equal(\.rightAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(value: String, title: String, color: UIColor) {
        backgroundColor = color
        titleLabel.text = title
        valueLabel.text = value
    }
}
