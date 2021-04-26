//
//  SKAction.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation

extension SKAction {
    
    public enum Entity {
        /// color
        case color(_ color: SKColorable, _ handle: (_ style: SKUserInterfaceStyle, _ color: SKColorable) -> Void)
        /// colors
        case colors(_ colors: [SKColorable], _ handle: (_ style: SKUserInterfaceStyle, _ colors: [SKColorable]) -> Void)
    }
}

/// SKAction
public class SKAction: NSObject {
    public typealias Key = NSString
    
    /// Entity
    private let entity: Entity
    
    /// 构建
    /// - Parameter entity: Entity
    internal init(entity: Entity) {
        self.entity = entity
    }
}

extension SKAction {
    
    /// run actuion handle
    /// - Parameter style: SKUserInterfaceStyle
    @discardableResult
    public func run(with style: SKUserInterfaceStyle = .current) -> Self {
        // handle(style, color)
        switch entity {
        case .color(let color, let handle):
            handle(style, color)
        case .colors(let colors, let handle):
            handle(style, colors)
        }
        return self
    }
}
