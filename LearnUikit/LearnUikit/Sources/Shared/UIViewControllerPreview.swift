//
//  UIViewControllerPreview.swift
//  LearnUikit
//
//  Created by dgsw30 on 4/1/25.
//

import SwiftUI
import UIKit

public struct UIViewControllerPreview: UIViewControllerRepresentable {
    let viewController: () -> UIViewController
    
    public func makeUIViewController(context: Context) -> UIViewController {
        return viewController()
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
