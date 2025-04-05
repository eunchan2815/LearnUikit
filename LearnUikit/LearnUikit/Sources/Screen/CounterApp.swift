//
//  CounterApp.swift
//  LearnUikit
//
//  Created by dgsw30 on 4/1/25.
//

import UIKit
import SwiftUI

class CounterApp: UIViewController {
    
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let plusLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.tintColor = .init(.green)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let minusLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        button.tintColor = .init(.red)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = UIButton.Configuration.filled()
        button.configuration?.background.backgroundColor = .systemPink
        let boldTitle = NSAttributedString(
            string: "초기화",
            attributes: [.font: UIFont.boldSystemFont(ofSize: 18)]
        )
        button.setAttributedTitle(boldTitle, for: .normal)
        button.addTarget(self, action: #selector(resetLabel), for: .touchUpInside)
        return button
    }()
    
    
    private func setupLayout() {
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        plusLabel.translatesAutoresizingMaskIntoConstraints = false
        minusLabel.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(countLabel)
        view.addSubview(plusLabel)
        view.addSubview(minusLabel)
        view.addSubview(resetButton)
        
        NSLayoutConstraint.activate([
            plusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 70),
            plusLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30),
            
            minusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -70),
            minusLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 30),
            resetButton.widthAnchor.constraint(equalToConstant: 150),
            resetButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc private func plusButtonTapped() {
        count += 1
        updateLabel()
    }
    
    @objc private func minusButtonTapped() {
        count -= 1
        updateLabel()
    }
    
    @objc private func updateLabel() {
        countLabel.text = "\(count)"
    }
    
    @objc private func resetLabel() {
        count = 0
        updateLabel()
    }
}

#Preview {
    UIViewControllerPreview {
        CounterApp()
    }
}
