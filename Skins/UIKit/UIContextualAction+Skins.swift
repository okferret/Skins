//
//  UIContextualAction+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit.UIContextualAction

@available(iOS 11.0, *)
extension SKCompatibleWrapper where Base: UIContextualAction {
    
    /// The background color of the action button.
    public var backgroundColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.backgroundColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(color: color) { [weak base](style, color) in
                base?.backgroundColor = color.color(for: style)
            }
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
}
