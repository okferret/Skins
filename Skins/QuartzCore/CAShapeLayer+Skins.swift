//
//  CAShapeLayer+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import QuartzCore

extension SKCompatibleWrapper where Base: CAShapeLayer {
    
    /* The color to fill the path, or nil for no fill. Defaults to opaque
     * black. Animatable. */
    public var fillColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.fillColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(color: color) { [weak base](style, color) in
                base?.fillColor = color.color(for: style).cgColor
            }
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
    
    /* The color to fill the path's stroked outline, or nil for no stroking.
     * Defaults to nil. Animatable. */
    public var strokeColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.strokeColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(color: color) { [weak base](style, color) in
                base?.strokeColor = color.color(for: style).cgColor
            }
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
    
}
