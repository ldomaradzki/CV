//
//  CircleView.swift
//  CV
//
//  Created by Lukasz Domaradzki on 11/01/2021.
//

import Foundation
import UIKit

class CircleView: UIView {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 26)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.text = "UIKit"
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let colors: [UIColor] = [.brightOrange, .greenish, .yellowish]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = frame.width / 2.0
        backgroundColor = colors[Int.random(in: 0 ..< colors.count)]
        
        let size = frame.width - 8
        label.frame = CGRect(origin: .zero, size: CGSize(width: size, height: size))
        label.center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        addSubview(label)
    }
    
    func setLabel(text: String) {
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var collisionBoundsType: UIDynamicItemCollisionBoundsType {
        .path
    }
    
    override var collisionBoundingPath: UIBezierPath {
        let radius = min(bounds.size.width, bounds.size.height) / 2.0
        return UIBezierPath(arcCenter: CGPoint.zero, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2.0), clockwise: true)
    }
}
