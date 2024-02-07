//
//  LoginViewController.swift
//  Neobis
//
//  Created by Людмила Долонтаева on 2024-02-06.
//

import UIKit
import SnapKit
import NotificationBannerSwift

class LoginViewController: UIViewController {
    
    private let loginLabel = UILabel()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = PrimaryButton()
    private let forgotPasswordButton = UIButton()
    private let togglePasswordVisibilityButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
        setUpLayout()
    }
    
    private func setUpLayout() {
        view.backgroundColor = .white
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginLabel)
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(168)
            make.centerX.equalToSuperview()
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(37)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(10)
            make.left.right.equalTo(loginTextField)
            make.height.equalTo(loginTextField)
        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.right.equalTo(passwordTextField)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(20)
            make.left.right.equalTo(loginTextField)
            make.height.equalTo(52)
        }
    }
    
    private func setUpStyle() {
        
        loginLabel.text = "Вход"
        loginLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        loginLabel.textColor = .black
        
        loginTextField.placeholder = "Логин"
        loginTextField.borderStyle = .none
        loginTextField.layer.cornerRadius = 16
        loginTextField.layer.masksToBounds = true
        loginTextField.backgroundColor = AppColorEnum.extraLightGrey.color
        loginTextField.setLeftPaddingPoints(16)
        loginTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        loginTextField.delegate = self
        
        passwordTextField.delegate = self
        passwordTextField.placeholder = "Пароль"
        passwordTextField.borderStyle = .none
        passwordTextField.layer.cornerRadius = 16
        passwordTextField.layer.masksToBounds = true
        passwordTextField.backgroundColor = AppColorEnum.extraLightGrey.color
        passwordTextField.setLeftPaddingPoints(16)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.rightView = togglePasswordVisibilityButton
        passwordTextField.rightViewMode = .always
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        togglePasswordVisibilityButton.setImage(UIImage(named: "showPasswordImage"), for: .normal)
        togglePasswordVisibilityButton.setImage(UIImage(named: "hidePasswordImage"), for: .selected)
        togglePasswordVisibilityButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        togglePasswordVisibilityButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -18, bottom: 0, right: 18)
        
        forgotPasswordButton.setTitle("Забыли пароль?", for: .normal)
        forgotPasswordButton.setTitleColor(AppColorEnum.secodaryDarkPurpleColor.color, for: .normal)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonDidTap), for: .touchUpInside)
        
        loginButton.setTitle("Войти", for: .normal)
        loginButton.backgroundColor = AppColorEnum.disabledPurpleColor.color
        loginButton.layer.cornerRadius = 16
        loginButton.isEnabled = false
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        let isLoginFilled = !(loginTextField.text?.isEmpty ?? true)
        let isPasswordFilled = !(passwordTextField.text?.isEmpty ?? true)
        loginButton.isEnabled = isLoginFilled && isPasswordFilled
        loginButton.backgroundColor = loginButton.isEnabled ? AppColorEnum.mainPurpleColor.color : AppColorEnum.disabledPurpleColor.color
        highlightTextField(textField, isError: false)
    }
    
    @objc private func forgotPasswordButtonDidTap() {
        let passwordRecoveryViewController = PasswordRecoveryViewController()
        navigationController?.pushViewController(passwordRecoveryViewController, animated: true)
    }
    
    @objc private func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        togglePasswordVisibilityButton.isSelected.toggle()
    }
    
    @objc private func loginButtonTapped() {
        guard let login = loginTextField.text, !login.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            return
        }
        
        if login == "User" && password == "password" {
            //            goToMainPage()
        } else {
            showErrorBanner()
            highlightTextField(loginTextField, isError: true)
            highlightTextField(passwordTextField, isError: true)
        }
    }
    
    private func highlightTextField(_ textField: UITextField, isError: Bool) {
        if isError {
            textField.layer.borderColor = UIColor.red.cgColor
            textField.layer.borderWidth = 1.0
        } else {
            
            if textField.isFirstResponder {
                textField.layer.borderColor = UIColor.purple.cgColor
                textField.layer.borderWidth = 1.0
            } else {
                textField.layer.borderColor = UIColor.clear.cgColor
                textField.layer.borderWidth = 0
            }
        }
    }
    
    
    private func showErrorBanner() {
        let image = UIImage(named: "errorImage")
        let imageView = UIImageView(image: image)
        
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }
        let banner = FloatingNotificationBanner(
            title: "",
            subtitle: "Неверный логин или пароль",
            subtitleFont: .systemFont(ofSize: 20),
            leftView: imageView,
            style: .danger
        )
        banner.show(
            edgeInsets: UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16),
            cornerRadius: 16
        )
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        highlightTextField(textField, isError: false)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 0
    }
    
}

#Preview {
    LoginViewController()
}

