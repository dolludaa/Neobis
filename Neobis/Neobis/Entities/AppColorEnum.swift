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
    case mainGreyTextColor
    case secodaryDarkPurpleColor
    case disabledPurpleColor
    case errorColor
    case extraLightGrey

    var color: UIColor {
        switch self {
        case .mainPurpleColor:
            return UIColor(hex: 0x9A1DD5)
        case .mainGreyTextColor:
            return UIColor(hex: 0x424554)
        case .secodaryDarkPurpleColor:
            return UIColor(hex: 0x740EA5)
        case .disabledPurpleColor:
            return UIColor(hex: 0xCCBEDE)
        case .errorColor:
            return UIColor(hex: 0xF45E5E)
        case .extraLightGrey:
            return UIColor(hex: 0xEEF2F6)
        }
    }
}

