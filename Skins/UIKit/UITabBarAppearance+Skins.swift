//
//  UITabBarAppearance+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit.UITabBarAppearance

@available(iOS 13.0, *)
extension SKCompatibleWrapper where Base: UITabBarAppearance {
    
    /// The tint color to apply to the selection indicator image.
    internal var selectionIndicatorTintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.selectionIndicatorTintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(color: color) { [weak base](style, color) in
                base?.selectionIndicatorTintColor = color.color(for: style)
            }
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
}

