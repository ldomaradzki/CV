//
//  AboutHeaderView.swift
//  CV
//
//  Created by Lukasz Domaradzki on 11/01/2021.
//

import Foundation
import UIKit

class AboutHeaderView: UIView {
    private let photoSize: CGFloat = 240
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 36)
        label.text = "Łukasz Domaradzki"
        label.textColor = .white
        return label
    }()
    private lazy var positionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "iOS developer, UX designer, scrum master"
        label.textColor = UIColor.white.withAlphaComponent(0.8)
        return label
    }()
    private lazy var stars = UIImageView(image: UIImage(named: "AboutHeaderStars"))
    private lazy var aboutBackground = UIImageView(image: UIImage(named: "AboutHeaderBackground"))
    private lazy var photo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Photo"))
        imageView.layer.cornerRadius = photoSize/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 7
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .greenish
        layer.cornerRadius = 30
        
        addSubview(aboutBackground, constraints: [
            equal(\.topAnchor, constant: 60),
            equal(\.leftAnchor),
            equal(\.rightAnchor),
            equal(\.bottomAnchor)
        ])
        
        addSubview(stars, constraints: [
            equal(\.topAnchor, constant: -20),
            equal(\.leftAnchor, constant: 90),
            constant(\.widthAnchor, constant: 229*3.3),
            constant(\.heightAnchor, constant: 70*3.3)
        ])
        
        addSubview(photo, constraints: [
            equal(\.centerYAnchor),
            equal(\.rightAnchor, constant: -30),
            constant(\.heightAnchor, constant: photoSize),
            constant(\.widthAnchor, constant: photoSize)
        ])
        
        addSubview(nameLabel, constraints: [
            equal(\.topAnchor, constant: 20),
            equal(\.leftAnchor, constant: 20)
        ])
        
        addSubview(positionLabel, constraints: [
            equal(\.leftAnchor, constant: 20),
            equal(\.topAnchor, otherView: nameLabel, \.bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
