//
//  UISwitch+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit.UISwitch

extension SKCompatibleWrapper where Base: UISwitch {
    
    /// The color used to tint the appearance of the switch when it’s in the on position.
    public var onTintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.onTintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(color: color) { [weak base](style, color) in
                base?.onTintColor = color.color(for: style)
            }
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
    
    /// The color used to tint the appearance of the thumb.
    public var thumbTintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.thumbTintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(color: color) { [weak base](style, color) in
                base?.thumbTintColor = color.color(for: style)
            }
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
}
