//
//  UIColor++Extensions.swift
//  Unsplash_Ex
//
//  Created by KEEN on 2022/06/05.
//

import UIKit

enum CustomColor {
    case main
    case sub
    case background
}

extension UIColor {
    static func appColor(_ name: CustomColor) -> UIColor {
        switch name {
        case .main: return UIColor(named: "mainColor")!
        case .sub: return UIColor(named: "subColor")!
        case .background: return UIColor(named: "backgroundColor")!
        }
    }
    //
    // static func appCGColor(_ name: CustomColor) -> CGColor {
    //     switch name {
    //     case .main: return appCGColor(.main).cgColor
    //     case .sub: return appCGColor(.sub).cgColor
    //     case .background: return appCGColor(.background).cgColor
    //     }
    // }
}

extension CGColor {
    static func appCGColor(_ name: CustomColor) -> CGColor {
        switch name {
        case .main: return UIColor.appColor(.main).cgColor
        case .sub: return UIColor.appColor(.sub).cgColor
        case .background: return UIColor.appColor(.background).cgColor
        }
    }
}
