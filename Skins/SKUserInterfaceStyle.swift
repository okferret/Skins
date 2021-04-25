//
//  SKUserInterfaceStyle.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit

extension SKUserInterfaceStyle {
    
    /// userDefaultsKey
    internal static var userDefaultsKey: String { "SKUserInterfaceStyle.userDefaults.key" }
}

/// SKUserInterfaceStyle
public struct SKUserInterfaceStyle {
    /// raw value of SKUserInterfaceStyle
    internal let rawValue: String
    
    /// 构建
    /// - Parameter rawValue: String
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension SKUserInterfaceStyle: Equatable {
    
    /// ==
    /// - Parameters:
    ///   - lhs: Self
    ///   - rhs: Self
    /// - Returns: Bool
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension SKUserInterfaceStyle {
    
    /// SKUserInterfaceStyle.unspecified
    public static let unspecified: SKUserInterfaceStyle = .init(rawValue: "SKUserInterfaceStyle.unspecified")
    /// SKUserInterfaceStyle.light
    public static let light: SKUserInterfaceStyle = .init(rawValue: "SKUserInterfaceStyle.light")
    /// SKUserInterfaceStyle.dark
    public static let dark: SKUserInterfaceStyle = .init(rawValue: "SKUserInterfaceStyle.dark")
    
    /// SKUserInterfaceStyle
    public static var current: SKUserInterfaceStyle {
        return Skins.shared.interfaceStyle
    }
}
