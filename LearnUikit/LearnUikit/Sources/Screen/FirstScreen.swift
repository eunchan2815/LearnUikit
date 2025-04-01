//
//  ViewController.swift
//  LearnUikit
//
//  Created by dgsw30 on 4/1/25.
//

import UIKit

class FirstScreen: UIViewController, UITextFieldDelegate {
    
    var emailTextField: UITextField!
    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        view.backgroundColor = .systemBackground
        title = "firstScreen"
        navigationController?.navigationBar.prefersLargeTitles = true
        //MARK: largeTitle 적용
        
        emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        
        // 텍스트 필드 스타일 설정
        emailTextField.keyboardType = .emailAddress    // 이메일 입력을 위한 키보드
        emailTextField.returnKeyType = .done           // "완료" 버튼
        emailTextField.placeholder = "이메일 입력"    // placeholder 설정
        emailTextField.borderStyle = .roundedRect     // 둥근 테두리 스타일
        emailTextField.isSecureTextEntry = false      // 비밀번호 입력 시 *로 표시 여부
        emailTextField.clearButtonMode = .always      // 항상 clear 버튼 표시
        emailTextField.autocapitalizationType = .none // 자동 대문자 방지
        emailTextField.textColor = .black             // 글자 색상
        emailTextField.tintColor = .systemPink        // 커서 색상
        emailTextField.backgroundColor = .clear       // 배경색 투명
        
        emailTextField.delegate = self
        
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            emailTextField.widthAnchor.constraint(equalToConstant: 350),
            emailTextField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupButton() {
        view.addSubview(nextButton)
        
        nextButton.configuration = UIButton.Configuration.filled()
        nextButton.configuration?.background.backgroundColor = .systemPink
        let boldTitle = NSAttributedString(
            string: "로그인",
            attributes: [.font: UIFont.boldSystemFont(ofSize: 18)]
        )
        nextButton.setAttributedTitle(boldTitle, for: .normal)
        
        nextButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        //MARK: button action label
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 350),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //MARK: navigation function
    @objc func handleNext() {
        let nextScreen = SecondScreen()
        nextScreen.title = "SecondScreen"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    //MARK: UITextFieldDelegate - 텍스트 필드가 첫 번째 응답자가 될 때 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    //MARK: 화면을 터치하면 키보드 내려가도록 설정
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
