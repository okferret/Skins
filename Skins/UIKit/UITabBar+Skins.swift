//
//  UITabBar+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/26.
//

import Foundation
import UIKit

extension SKCompatibleWrapper where Base: UITabBar {
    
    /// The tint color to apply to the tab bar items.
    public var tintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.tintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.tintColor = color.color(for: style)
            }))
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
    
    /// The tint color to apply to unselected tabs.
    @available(iOS 10.0, *)
    public var unselectedItemTintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.unselectedItemTintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.unselectedItemTintColor = color.color(for: style)
            }))
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
    
    /// The tint color to apply to the tab bar background.
    public var barTintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.barTintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.barTintColor = color.color(for: style)
            }))
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
    
    /// The tint color applied to the selected tab bar item.
    @available(iOS, introduced: 5.0, deprecated: 8.0)
    public var selectedImageTintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.selectedImageTintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.selectedImageTintColor = color.color(for: style)
            }))
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
}
