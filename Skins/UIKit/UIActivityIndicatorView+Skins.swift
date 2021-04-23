//
//  UIActivityIndicatorView+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit.UIActivityIndicatorView


extension SKCompatibleWrapper where Base: UIActivityIndicatorView {
    
    /// The color of the activity indicator.
    public var color: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.color = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(color: color) { [weak base](style, color) in
                base?.color = color.color(for: style)
            }
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
}
