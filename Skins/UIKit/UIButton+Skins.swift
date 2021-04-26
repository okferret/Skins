//
//  UIButton+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit.UIButton

extension SKCompatibleWrapper where Base: UIButton {
    
    /// Sets the color of the title to use for the specified state.
    /// - Parameters:
    ///   - color: Skins.Color
    ///   - state: UIControl.State
    public func setTitleColor(_ color: Skins.Color?, for state: UIControl.State) {
        guard let colorKey = color, let color = Skins.shared.color(for: colorKey) else {
            base.setTitleColor(nil, for: state)
            return
        }
        let actionKey: SKAction.Key = .init(string: #function + "_\(state)")
        let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
            base?.setTitleColor(color.color(for: style), for: state)
        }))
        Skins.shared.set((actionKey, action), for: base)
        action.run()
    }
    
    /// Sets the color of the title shadow to use for the specified state.
    /// - Parameters:
    ///   - color: Skins.Color
    ///   - state: UIControl.State
    public func setTitleShadowColor(_ color: Skins.Color?, for state: UIControl.State) {
        guard let colorKey = color, let color = Skins.shared.color(for: colorKey) else {
            base.setTitleShadowColor(nil, for: state)
            return
        }
        let actionKey: SKAction.Key = .init(string: #function + "_\(state)")
        let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
            base?.setTitleShadowColor(color.color(for: style), for: state)
        }))
        Skins.shared.set((actionKey, action), for: base)
        action.run()
    }
    
    /// The tint color to apply to the button title and image.
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
