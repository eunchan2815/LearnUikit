//
//  UINavigationController.swift
//  LearnUikit
//
//  Created by dgsw30 on 4/1/25.
//

import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = false
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
