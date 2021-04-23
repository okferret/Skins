//
//  SKUserInterfaceStyle.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit

/// SKUserInterfaceStyle
public struct SKUserInterfaceStyle {
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
    /// SKUserInterfaceStyle.light
    public static let light: SKUserInterfaceStyle = .init(rawValue: "SKUserInterfaceStyle.light")
    /// SKUserInterfaceStyle.dark
    public static let dark: SKUserInterfaceStyle = .init(rawValue: "SKUserInterfaceStyle.dark")
    
    /// SKUserInterfaceStyle
    public static var current: SKUserInterfaceStyle {
        if let value  = UserDefaults.standard.string(forKey: "SKUserInterfaceStyle.current.key") {
            return .init(rawValue: value)
        } else {
            if #available(iOS 13.0, *) {
                return UITraitCollection.current.userInterfaceStyle == .dark ? .dark : .light
            } else {
                return .light
            }
        }
    }
}
