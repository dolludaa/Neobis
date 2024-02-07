//
//  AppColorEnum.swift
//  Neobis
//
//  Created by Людмила Долонтаева on 2024-02-06.
//

import Foundation
import UIKit

enum AppColorEnum {
    case mainPurpleColor

    var color: UIColor {
        switch self {
        case .mainPurpleColor:
            return UIColor(hex: 0x9A1DD5)
        }
    }
}
