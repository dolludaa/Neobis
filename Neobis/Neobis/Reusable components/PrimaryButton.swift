//
//  PrimaryButton.swift
//  Neobis
//
//  Created by Людмила Долонтаева on 2024-02-07.
//

import UIKit

class PrimaryButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor = AppColorEnum.mainPurpleColor.color
        titleLabel?.font = .systemFont(ofSize: 20)
        layer.cornerRadius = 16
    }
}
