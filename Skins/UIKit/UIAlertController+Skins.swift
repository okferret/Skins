//
//  UIAlertController+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit.UIAlertController

extension SKCompatibleWrapper where Base: UIAlertController {
    
    /// Skins.Color? 
    public var tintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.view.tintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.view.tintColor = color.color(for: style)
            }))
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
}
