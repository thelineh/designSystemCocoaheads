//
//  UIView+Pod.swift
//  DesignSystemPod
//
//  Created by Aline Ghizzi on 26/01/20.
//  Copyright © 2020 Aline. All rights reserved.
//

import UIKit

extension UIView {
    func bindFrameToSuperviewBounds(offset insets: UIEdgeInsets = UIEdgeInsets.zero) {
        guard let superview = self.superview else {
            let errorMessage = """
                Error! `superview` was nil:
                – call `addSubview(view: UIView)` before calling `bindFrameToSuperviewBounds()` to fix this.
            """
            print(errorMessage)
            return
        }

        self.translatesAutoresizingMaskIntoConstraints = false
        let horizontalFormat =  "H:|-\(insets.top)-[subview]-\(insets.bottom)-|"
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: horizontalFormat,
                                                                options: .directionLeadingToTrailing,
                                                                metrics: nil,
                                                                views: ["subview": self]))
        let verticalFormat = "V:|-\(insets.left)-[subview]-\(insets.right)-|"
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: verticalFormat,
                                                                options: .directionLeadingToTrailing,
                                                                metrics: nil,
                                                                views: ["subview": self]))
    }
}
