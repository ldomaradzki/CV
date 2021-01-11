//
//  SkillsViewController.swift
//  CV
//
//  Created by Lukasz Domaradzki on 09/01/2021.
//

import Foundation
import UIKit

class SkillsViewController: UIViewController {
    private lazy var backgroundView = UIImageView(image: UIImage(named: "SkillsBackground"))
    private lazy var animator = UIDynamicAnimator(referenceView: view)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundView, constraints: [
            equal(\.bottomAnchor),
            equal(\.leftAnchor, constant: -1),
            equal(\.rightAnchor),
            constant(\.heightAnchor, constant: 400),
        ])
    }
    
    func setup(_ viewModel: SkillsViewModel) {
        var skillCircles: [UIView] = []
        for skill in viewModel.allSkills {
            let size = CGFloat.random(in: 110 ..< 140)
            let circle = CircleView(
                frame: CGRect( x: CGFloat.random(in: 100 ..< 600),
                               y: CGFloat.random(in: 120 ..< 600),
                               width: size,
                               height: size))
            circle.setLabel(text: skill)
            circle.alpha = 0.0
            view.addSubview(circle)
            skillCircles.append(circle)
            
            UIView.animate(withDuration: 2.0, delay: TimeInterval.random(in: 0.1 ..< 1.5), options: [.curveEaseOut]) {
                circle.alpha = 1.0
            } completion: { _ in }
        }

        let collision = UICollisionBehavior(items: skillCircles)
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.setTranslatesReferenceBoundsIntoBoundary(with: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        animator.addBehavior(collision)
        
        for item in skillCircles {
            let field = UIFieldBehavior.noiseField(smoothness: 0.1, animationSpeed: 100)
            field.addItem(item)
            animator.addBehavior(field)
        }
        
        let itemBehaviour = UIDynamicItemBehavior(items: skillCircles)
        itemBehaviour.allowsRotation = false
        animator.addBehavior(itemBehaviour)
    }
}
