//
//  SKColor.swift
//  Skins-Demo
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import Skins
import UIKit

extension SKUserInterfaceStyle {
    
    /// SKUserInterfaceStyle
    internal static let cool: SKUserInterfaceStyle = {
        if #available(iOS 13.0, *) {
            return .init(rawValue: "SKUserInterfaceStyle.cool", overrideUserInterfaceStyle: .dark)
        } else {
            return .init(rawValue: "SKUserInterfaceStyle.cool")
        }
    }()
}

struct SKColor: SKColorable {
    let light: String
    let dark: String
    let cool: String
}

extension SKColor {
    
    /// value for interfaceStyle
    /// - Parameter interfaceStyle: SKUserInterfaceStyle
    /// - Returns: String
    internal func value(for interfaceStyle: SKUserInterfaceStyle) -> String {
        switch interfaceStyle {
        case .dark: return dark
        case .light: return light
        case .cool: return cool
        case .unspecified:
            if #available(iOS 13.0, *) {
                return UITraitCollection.current.userInterfaceStyle == .dark ? dark : light
            } else {
                return light
            }
        default: return light
        }
    }
}

// MARK: - global

struct Hue { }

extension Hue {
    /// Global
    internal enum Global: String {
        case major = "global.major"
        case meduim = "global.meduim"
        case foreground = "global.foreground"
    }
}

extension Skins.Color {
    
    /// 全局颜色
    /// - Parameter color: Global
    /// - Returns: Skins.Color
    internal static func global(_ hue: Hue.Global) -> Skins.Color {
        return .init(keyPath: hue.rawValue)
    }
}
