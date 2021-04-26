//
//  UIPopoverPresentationController+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/26.
//

import Foundation
import UIKit

extension SKCompatibleWrapper where Base: UIPopoverPresentationController {
    
    /// Set popover background color. Set to nil to use default background color. Default is nil
    public var backgroundColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.backgroundColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color(color, { [weak base] (style, color) in
                base?.backgroundColor = color.color(for: style)
            }))
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
}
