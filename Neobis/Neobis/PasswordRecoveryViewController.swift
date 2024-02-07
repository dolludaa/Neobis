//
//  PasswordRecoveryViewController.swift
//  Neobis
//
//  Created by Людмила Долонтаева on 2024-02-07.
//

import UIKit

class PasswordRecoveryViewController: UIViewController, UITextFieldDelegate {
    
    private let recoveryLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let emailTextField = UITextField()
    private let nextButton = UIButton()
    
    private let passwordResetService = PasswordResetService()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setUp()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(recoveryLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(emailTextField)
        view.addSubview(nextButton)
        
        recoveryLabel.text = "Восстановление пароля"
        recoveryLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        recoveryLabel.numberOfLines = 0
        recoveryLabel.textAlignment = .center
        
        descriptionLabel.text = "Введите электронную почту, которую вы указывали в профиле"
        descriptionLabel.font = .systemFont(ofSize: 18)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        emailTextField.borderStyle = .none
        emailTextField.placeholder = "Электронная почта"
        emailTextField.layer.cornerRadius = 16
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.backgroundColor = UIColor(white: 0.95, alpha: 1)
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.delegate = self
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        nextButton.backgroundColor = UIColor.systemPurple.withAlphaComponent(0.5)
        nextButton.setTitle("Далее", for: .normal)
        nextButton.layer.cornerRadius = 16
//        nextButton.isEnabled = false
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        
        recoveryLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(116)
            make.left.equalTo(view).offset(58)
            make.right.equalTo(view).offset(-58)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(recoveryLabel.snp.bottom).offset(24)
            make.left.equalTo(view).offset(38)
            make.right.equalTo(view).offset(-38)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(34)
            make.left.equalTo(view).offset(16)
            make.right.equalTo(view).offset(-16)
            make.height.equalTo(52)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(24)
            make.left.equalTo(emailTextField.snp.left)
            make.right.equalTo(emailTextField.snp.right)
            make.height.equalTo(52)
        }
    }
    
    private func setUp() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: emailTextField.frame.height))
        emailTextField.leftView = paddingView
        emailTextField.leftViewMode = .always
    }
    
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        nextButton.isEnabled = isValidEmail(text)
        nextButton.backgroundColor = isValidEmail(text) ? .systemPurple : .systemPurple.withAlphaComponent(0.5)
    }
    
    @objc private func nextButtonTapped() {
           guard let email = emailTextField.text, isValidEmail(email) else {
               print("Invalid email address")
               return
           }
           
           passwordResetService.resetPassword(email: email) {  success, message in
               if success {
                   print("Success: \(message)")
               } else {
                   print("Error: \(message)")
               }
           }
       }
    
    private func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

#Preview {
    PasswordRecoveryViewController()
}

