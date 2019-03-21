//
//  UIView+constrainToParent.swift
//  Pulley
//
//  Created by Mathew Polzin on 8/22/17.
//

import UIKit

extension UIView {
    
    func constrainToParent() {
        constrainToParent(insets: .zero)
    }
    
    func constrainToParent(insets: UIEdgeInsets) -> [NSLayoutConstraint]? {
        guard let parent = superview else { return nil}
        
        translatesAutoresizingMaskIntoConstraints = false
        let metrics: [String : Any] = ["left" : insets.left, "right" : insets.right, "top" : insets.top, "bottom" : insets.bottom]
        let constraints = ["H:|-(left)-[view]-(right)-|", "V:|-(top)-[view]-(bottom)-|"].flatMap {
            NSLayoutConstraint.constraints(withVisualFormat: $0, metrics: metrics, views: ["view": self])
        }
        parent.addConstraints(constraints)
        return constraints
    }
}
