//
//  UIViewController.swift
//  LearnUikit
//
//  Created by dgsw30 on 4/1/25.
//

import UIKit

extension UIViewController {
    func setupCustomBackButton() {
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(handleBack), for: .touchUpInside)

        let barButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = barButtonItem
    }

    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }
}
