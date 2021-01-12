//
//  TextBubbleView.swift
//  CV
//
//  Created by Lukasz Domaradzki on 11/01/2021.
//

import Foundation
import UIKit

class TextBubbleView: UIView {
    private let photoSize: CGFloat = 70
    private lazy var tailView = UIImageView(image: UIImage(named: "Tail"))
    private lazy var photoView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "PhotoAI"))
        imageView.layer.cornerRadius = photoSize/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.brightOrange.cgColor
        return imageView
    }()
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 16)
        label.textColor = .blackish
        label.numberOfLines = 0
        label.text = "\"He quickly became one of our most valued employees, the person everyone went to with questions and special projects. His dedication and willingness to work long hours to get the job done have made him a favorite team member for everyone on staff.\""
        label.textAlignment = .justified
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .secondaryBackground
        layer.cornerRadius = 30
        
        addSubview(tailView, constraints: [
            equal(\.topAnchor, \.bottomAnchor, constant: -40),
            equal(\.centerXAnchor, constant: 10),
            constant(\.widthAnchor, constant: 40*3),
            constant(\.heightAnchor, constant: 36*3)
        ])
        
        addSubview(photoView, constraints: [
            equal(\.topAnchor, \.bottomAnchor, constant: -10),
            equal(\.rightAnchor, constant: -10),
            constant(\.widthAnchor, constant: photoSize),
            constant(\.heightAnchor, constant: photoSize)
        ])
        
        addSubview(textLabel, constraints: [
            equal(\.topAnchor, constant: 20),
            equal(\.bottomAnchor, constant: -20),
            equal(\.leftAnchor, constant: 20),
            equal(\.rightAnchor, constant: -20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
