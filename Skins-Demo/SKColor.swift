//
//  SKColor.swift
//  Skins-Demo
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import Skins

extension SKUserInterfaceStyle {
    
    internal static let cool: SKUserInterfaceStyle = .init(rawValue: "SKUserInterfaceStyle.cool")
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
        default: return light
        }
    }
}

extension Skins.Color {
    
    /// major color
    internal static var major: Skins.Color {
        return .init(rawValue: #function)
    }
    
    internal static var meduim: Skins.Color {
        return .init(rawValue: #function)
    }
    
    internal static var foreground: Skins.Color {
        return .init(rawValue: #function)
    }
}
