//
//  MenuContactView.swift
//  CV
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation
import UIKit

class MenuContactView: UIView {
    @UsesAutoLayout
    private var contactButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.backgroundColor = .white
        button.setTitle("Mail me!", for: .normal)
        button.tintColor = .primaryColor
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        button.layer.shadowRadius = 0
        button.layer.shadowOpacity = 0.5
        return button
    }()
    
    private var mailImage = UIImageView(image: UIImage(named: "Mail"))
    
    @UsesAutoLayout
    private var handImage = UIImageView(image: UIImage(named: "Hand"))
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .brightOrange
        layer.cornerRadius = 30
        
        addSubview(mailImage)
        mailImage.frame = CGRect(x: 50, y: -10, width: 81, height: 57)
        setupAnimation()
        
        addSubview(handImage, constraints: [
            equal(\.centerXAnchor),
            equal(\.centerYAnchor),
            constant(\.widthAnchor, constant: 58*3),
            constant(\.heightAnchor, constant: 61*3)
        ])
        
        addSubview(contactButton, constraints: [
            equal(\.centerXAnchor),
            equal(\.bottomAnchor, constant: -30.0),
            constant(\.widthAnchor, constant: 110),
            constant(\.heightAnchor, constant: 40)
        ])
    }
    
    private func setupAnimation() {
        UIView.animate(withDuration: 5.0, delay: 0.0, options: [.curveEaseInOut, .repeat, .autoreverse]) {
            self.mailImage.frame = CGRect(x: 50, y: 10, width: 81, height: 57)
        } completion: { _ in }
    }
    
    func setButtonAction(_ action: UIAction) {
        contactButton.addAction(action, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
