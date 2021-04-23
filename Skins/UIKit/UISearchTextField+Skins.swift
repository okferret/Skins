//
//  UISearchTextField+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit.UISearchTextField

@available(iOS 13.0, *)
extension SKCompatibleWrapper where Base: UISearchTextField {
    
    /// The background color for all tokens in the search text field.
    public var tokenBackgroundColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.tokenBackgroundColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(color: color) { [weak base](style, color) in
                base?.tokenBackgroundColor = color.color(for: style)
            }
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
}
