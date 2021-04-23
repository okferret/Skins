//
//  SKAction.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation


/// SKAction
public class SKAction: NSObject {
    public typealias Key = NSString
    
    /// (_ style: SKUserInterfaceStyle, _ color: SKColorable) -> Void
    private let handle: (_ style: SKUserInterfaceStyle, _ color: SKColorable) -> Void
    /// SKColorable
    private let color: SKColorable
    
    /// 构建
    /// - Parameters:
    ///   - color: SKColorable
    ///   - handle: (_ style: SKUserInterfaceStyle, _ color: SKColorable) -> Void
    internal init(color: SKColorable, handle: @escaping (_ style: SKUserInterfaceStyle, _ color: SKColorable) -> Void) {
        self.color = color
        self.handle = handle
    }
}

extension SKAction {
    
    /// run actuion handle
    /// - Parameter style: SKUserInterfaceStyle
    @discardableResult
    public func run(with style: SKUserInterfaceStyle = .current) -> Self {
        handle(style, color)
        return self
    }
}
