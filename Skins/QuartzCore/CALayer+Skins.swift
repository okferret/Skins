//
//  CALayer+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import QuartzCore

extension CALayer: SKCompatible {}
extension SKCompatibleWrapper where Base: CALayer {
    
    /* The background color of the layer. Default value is nil. Colors
     * created from tiled patterns are supported. Animatable. */
    public var backgroundColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.backgroundColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.backgroundColor = color.color(for: style).cgColor
            }))
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
    
    /* The color of the layer's border. Defaults to opaque black. Colors
     * created from tiled patterns are supported. Animatable. */
    public var borderColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.borderColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.borderColor = color.color(for: style).cgColor
            }))
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
    
    /* The color of the shadow. Defaults to opaque black. Colors created
     * from patterns are currently NOT supported. Animatable. */
    
    /** Shadow properties. **/
    public var shadowColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.shadowColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.shadowColor = color.color(for: style).cgColor
            }))
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
}
