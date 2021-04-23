//
//  UIView+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit

extension UIView: SKCompatible {}
extension SKCompatibleWrapper where Base: UIView {
    
    /// The view’s background color.
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
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
    
    /// The first nondefault tint color value in the view’s hierarchy, ascending from and starting with the view itself.
    public var tintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.tintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(color: color) { [weak base](style, color) in
                base?.tintColor = color.color(for: style)
            }
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
}
