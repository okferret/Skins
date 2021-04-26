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
public struct SKUserInterfaceStyle: Codable {
    /// raw value of SKUserInterfaceStyle
    internal let rawValue: String
    
    /// UIUserInterfaceStyle
    @available(iOS 13.0, *)
    internal private(set) var overrideUserInterfaceStyle: UIUserInterfaceStyle {
        get { UIUserInterfaceStyle.init(rawValue: overrideUserInterfaceStyleValue) ?? .unspecified }
        set { overrideUserInterfaceStyleValue = newValue.rawValue }
    }
    
    /// value of UIUserInterfaceStyle
    private var overrideUserInterfaceStyleValue: Int = 0
    
    /// 构建
    /// - Parameter rawValue: String
    @available(iOS, introduced: 5.0, deprecated: 13.0, message: "deprecated use 'init(rawValue:overrideUserInterfaceStyle:)'")
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    /// 构建
    /// - Parameters:
    ///   - rawValue: String
    ///   - overrideUserInterfaceStyle: UIUserInterfaceStyle
    @available(iOS 13.0, *)
    public init(rawValue: String, overrideUserInterfaceStyle: UIUserInterfaceStyle = .light) {
        self.rawValue = rawValue
        self.overrideUserInterfaceStyle = overrideUserInterfaceStyle
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
    public static let unspecified: SKUserInterfaceStyle = {
        if #available(iOS 13.0, *) {
            return .init(rawValue: "SKUserInterfaceStyle.unspecified", overrideUserInterfaceStyle: .unspecified)
        } else {
            return .init(rawValue: "SKUserInterfaceStyle.unspecified")
        }
    }()
    /// SKUserInterfaceStyle.light
    public static let light: SKUserInterfaceStyle = {
        if #available(iOS 13.0, *) {
            return .init(rawValue: "SKUserInterfaceStyle.light", overrideUserInterfaceStyle: .light)
        } else {
            return .init(rawValue: "SKUserInterfaceStyle.light")
        }
    }()
    
    /// SKUserInterfaceStyle.dark
    public static let dark: SKUserInterfaceStyle = {
        if #available(iOS 13.0, *) {
            return .init(rawValue: "SKUserInterfaceStyle.dark", overrideUserInterfaceStyle: .dark)
        } else {
            return .init(rawValue: "SKUserInterfaceStyle.dark")
        }
    }()
    
    /// SKUserInterfaceStyle
    public static var current: SKUserInterfaceStyle {
        return Skins.shared.interfaceStyle
    }
}
