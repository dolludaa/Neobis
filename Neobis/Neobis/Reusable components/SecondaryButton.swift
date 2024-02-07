//
//  SecondaryButton.swift
//  Neobis
//
//  Created by Людмила Долонтаева on 2024-02-07.
//

import UIKit

class SecondaryButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        setTitleColor(AppColorEnum.mainPurpleColor.color, for: .normal)
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = AppColorEnum.mainPurpleColor.color.cgColor
        titleLabel?.font = .systemFont(ofSize: 20)
        layer.cornerRadius = 16
    }
}
