//
//  Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit

/// Skins
public class Skins: NSObject {
    
    // MARK: - 公开属性
    
    /// single object of Skins
    public static let shared: Skins = .init()
    ///  current interface style SKUserInterfaceStyle
    public private(set) var interfaceStyle: SKUserInterfaceStyle = .unspecified
    /// isDark
    public var isDark: Bool {
        switch interfaceStyle {
        case .dark: return true
        case .light: return false
        case .unspecified:
            if #available(iOS 13.0, *) {
                return UITraitCollection.current.userInterfaceStyle == .dark
            } else {
                return false
            }
        default:
            return false
        }
    }
    // MARK: - 私有属性
    
    /// [ColorKey: SKColorable]
    private lazy var colors: [Color: SKColorable] = [:]
    /// NSMapTable<NSObject, NSMutableDictionary>
    private lazy var map: NSMapTable<AnyObject, NSMutableDictionary> = .init(keyOptions: .weakMemory, valueOptions: .strongMemory)
    /// NSLock
    private lazy var lock: NSLock = .init()
    /// SKUserInterfaceStyle
    private var _interfaceStyle: SKUserInterfaceStyle {
        let defaultKey = SKUserInterfaceStyle.userDefaultsKey
        if let value = UserDefaults.standard.string(forKey: defaultKey) {
            return .init(rawValue: value)
        } else {
            return .unspecified
        }
    }
    
    // MARK: - 生命周期
    
    /// 构建
    private override init() {
        super.init()
        interfaceStyle = _interfaceStyle
    }
}

extension Skins {
    
    /// setup for skins
    /// - Parameters:
    ///   - colorType: color type
    ///   - fileUrl: url of plist file
    /// - Throws: Error
    @discardableResult
    public func setup<T: SKColorable>(colorType: T.Type, fileUrl: URL) throws -> Self {
        guard let dict = NSDictionary.init(contentsOf: fileUrl) as? [String: Any] else {
            throw SKError.init("can not paser plist file ....")
        }
        let decoder: JSONDecoder = .init()
        for (key, value) in dict {
            let data = try JSONSerialization.data(withJSONObject: value, options: [])
            let color = try decoder.decode(colorType.self, from: data)
            let colorKey: Color = .init(rawValue: key)
            colors[colorKey] = color
        }
        return self
    }
    
    /// color for key
    /// - Parameter key: ColorKey
    /// - Returns: SKColorable
    public func color(for key: Color) -> SKColorable? {
        return colors[key]
    }
    
    /// change style
    /// - Parameter interfaceStyle: SKUserInterfaceStyle
    public func change(style interfaceStyle: SKUserInterfaceStyle) {
        self.interfaceStyle = interfaceStyle
        // save style
        save(style: interfaceStyle)
        
        switch interfaceStyle {
        case .dark:
            if #available(iOS 13.0, *) {
                for window in UIApplication.shared.windows {
                    window.overrideUserInterfaceStyle = .dark
                }
            }
        case .light:
            if #available(iOS 13.0, *) {
                for window in UIApplication.shared.windows {
                    window.overrideUserInterfaceStyle = .light
                }
            }
        default: break
        }
        guard let map = map as? NSMapTable<AnyObject, AnyObject>, let dicts = NSAllMapTableValues(map) as? [NSDictionary] else { return }
        for dict in dicts {
            for value in dict.allValues where value is SKAction {
                guard let action = value as? SKAction else { continue }
                action.run(with: interfaceStyle)
            }
        }

    }
    
    /// save  interface to user defaults
    /// - Parameter interfaceStyle: SKUserInterfaceStyle
    private func save(style interfaceStyle: SKUserInterfaceStyle) {
        let defaultKey = SKUserInterfaceStyle.userDefaultsKey
        if interfaceStyle == .unspecified {
            UserDefaults.standard.setValue(nil, forKey: defaultKey)
            UserDefaults.standard.synchronize()
        } else {
            UserDefaults.standard.setValue(interfaceStyle.rawValue, forKey: defaultKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    /// log
    public func log() {
        #if DEBUG
        guard let map = map as? NSMapTable<AnyObject, AnyObject> else { return }
        let contents = NSStringFromMapTable(map)
        print(contents)
        #endif
    }
}

extension Skins {
    
    /// set tuple for target
    /// - Parameters:
    ///   - tuple: (key: SKAction.Key, action: SKAction)
    ///   - target: NSObject
    public func set(_ tuple: (key: SKAction.Key, action: SKAction), for target: NSObject) {
        lock.skin.safe {
            if let dict = map.object(forKey: target) {
                dict[tuple.key] = tuple.action
                // map.setObject(dict, forKey: target)
            } else {
                let dict: NSMutableDictionary = [tuple.key: tuple.action]
                map.setObject(dict, forKey: target)
            }
        }
    }
    
    /// action for key on target
    /// - Parameters:
    ///   - key: SKAction.Key
    ///   - target: NSObject
    /// - Returns: SKAction?
    internal func action(for key: SKAction.Key, onTarget target: NSObject) -> SKAction? {
        return lock.skin.safe { () -> SKAction? in
            guard let dict = map.object(forKey: target) else { return nil }
            guard let action = dict.object(forKey: key) as? SKAction else { return nil }
            return action
        }
    }
}
