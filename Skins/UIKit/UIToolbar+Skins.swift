//
//  UIToolbar+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit.UIToolbar

extension SKCompatibleWrapper where Base: UIToolbar {
    
    /// The tint color to apply to the bar button items.
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
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
    
    ///The tint color to apply to the toolbar background.
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
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
}
