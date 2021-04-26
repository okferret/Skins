//
//  UISearchBar+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit.UISearchBar

extension SKCompatibleWrapper where Base: UISearchBar {
    
    /// The tint color to apply to the search bar background.
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
    
    /// The tint color to apply to key elements in the search bar.
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
}
