//
//  UITabBarItem+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit.UITabBarItem

extension SKCompatibleWrapper where Base: UITabBarItem {
    
    /// The background color to apply to the badge.
    @available(iOS 10.0, *)
    internal var badgeColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.badgeColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.badgeColor = color.color(for: style)
            }))
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
}
