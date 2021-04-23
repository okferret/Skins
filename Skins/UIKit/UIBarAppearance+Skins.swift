//
//  UIBarAppearance+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit.UIBarAppearance

@available(iOS 13.0, *)
extension UIBarAppearance: SKCompatible {}
@available(iOS 13.0, *)
extension SKCompatibleWrapper where Base: UIBarAppearance {
    
    /// The background color of the bar.
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
    
    /// The color to apply to the bar's custom or default shadow.
    public var shadowColor: Skins.Color? {
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
