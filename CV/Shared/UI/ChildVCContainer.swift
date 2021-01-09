//
//  ChildVCContainer.swift
//  CV
//
//  Created by Lukasz Domaradzki on 08/01/2021.
//

import Foundation
import UIKit

class ChildVCContainer: DisplayContainer {
    enum Side { case left, right }
    
    private let widthRatio: CGFloat = 0.23
    private let side: Side
    
    private weak var parent: UIViewController?
    weak var viewController: UIViewController?
    
    init(side: Side, parent: UIViewController) {
        self.side = side
        self.parent = parent
    }
    
    func display(_ viewController: UIViewController) {
        self.viewController = viewController
        parent?.add(viewController)
        setupLayout(viewController)
    }
    
    func removeViewController() {
        viewController?.willMove(toParent: nil)
        viewController?.view.removeFromSuperview()
        viewController?.removeFromParent()
        viewController = nil
    }
    
    func setupLayout(_ viewController: UIViewController) {
        guard let parentView = parent?.view,
              let view = viewController.view else { return }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [
            view.topAnchor.constraint(equalTo: parentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        ]
        
        switch side {
        case .left:
            constraints.append(contentsOf: [
                NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: parentView, attribute: .width, multiplier: widthRatio, constant: 0),
                view.leftAnchor.constraint(equalTo: parentView.leftAnchor),
                
            ])
        case .right:
            constraints.append(contentsOf: [
                NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: parentView, attribute: .width, multiplier: 1-widthRatio, constant: 0),
                view.rightAnchor.constraint(equalTo: parentView.rightAnchor)
            ])
        }
        
        NSLayoutConstraint.activate(constraints)
    }
}
