//
//  Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation

/// Skins
public class Skins: NSObject {
    
    // MARK: - 公开属性
    
    /// single object of Skins
    public static let shared: Skins = .init()
    
    // MARK: - 私有属性
    
    /// [ColorKey: SKColorable]
    private lazy var colors: [Color: SKColorable] = [:]
    /// NSMapTable<NSObject, NSMutableDictionary>
    private lazy var map: NSMapTable<AnyObject, NSMutableDictionary> = .init(keyOptions: .weakMemory, valueOptions: .strongMemory)
    /// NSLock
    private lazy var lock: NSLock = .init()
}

extension Skins {
    
    /// setup for skins
    /// - Parameters:
    ///   - colorType: color type
    ///   - fileUrl: url of plist file
    /// - Throws: Error
    public func setup<T: SKColorable>(colorType: T.Type, fileUrl: URL) throws {
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
    }
    
    /// color for key
    /// - Parameter key: ColorKey
    /// - Returns: SKColorable
    public func color(for key: Color) -> SKColorable? {
        return colors[key]
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
                map.setObject(dict, forKey: target)
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
