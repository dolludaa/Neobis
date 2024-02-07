//
//  WelcomeViewController.swift
//  Neobis
//
//  Created by Людмила Долонтаева on 2024-02-06.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    private let welcomeLabel = UILabel()
    private let globeImageView = UIImageView()
    private let studentButton = UIButton()
    private let teacherButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
        setUpLayout()
    }
    
    private func setUpStyle() {
        
        welcomeLabel.text = "Добро пожаловать!"
        welcomeLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        welcomeLabel.textColor = AppColorEnum.mainGreyTextColor.color
        welcomeLabel.textAlignment = .center
        
        globeImageView.image = UIImage(named: "globeImage")
        globeImageView.contentMode = .scaleAspectFit
        
        studentButton.setTitle("Я ученик", for: .normal)
        studentButton.titleLabel?.font = .systemFont(ofSize: 20)
        studentButton.backgroundColor = AppColorEnum.mainPurpleColor.color
        studentButton.layer.cornerRadius = 16
        
        teacherButton.setTitle("Я учитель", for: .normal)
        teacherButton.titleLabel?.font = .systemFont(ofSize: 20)
        teacherButton.backgroundColor = .white
        teacherButton.setTitleColor(AppColorEnum.mainPurpleColor.color, for: .normal)
        teacherButton.layer.borderColor = AppColorEnum.mainPurpleColor.color.cgColor
        teacherButton.layer.borderWidth = 1
        teacherButton.layer.cornerRadius = 16
    }
    
    private func setUpLayout() {
        
        view.addSubview(welcomeLabel)
        view.addSubview(globeImageView)
        view.addSubview(studentButton)
        view.addSubview(teacherButton)
        
        welcomeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(globeImageView.snp.top).offset(-47)
            make.left.right.equalToSuperview().inset(20)
        }
        
        globeImageView.snp.makeConstraints { make in
            make.bottom.equalTo(studentButton.snp.top)
            make.centerX.equalToSuperview()
            make.height.equalTo(325)
            make.width.equalTo(globeImageView.snp.height)
        }
        
        studentButton.snp.makeConstraints { make in
            make.top.equalTo(globeImageView.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        teacherButton.snp.makeConstraints { make in
            make.top.equalTo(studentButton.snp.bottom).offset(12)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-44)
            make.left.right.equalTo(studentButton)
            make.height.equalTo(studentButton)
        }
    }
}


#Preview {
    WelcomeViewController()
}
