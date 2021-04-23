//
//  CAReplicatorLayer+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import QuartzCore

extension SKCompatibleWrapper where Base: CAReplicatorLayer {
    
    /* The color to multiply the first object by (the source object). Defaults
      * to opaque white. Animatable. */
    public var instanceColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.instanceColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(color: color) { [weak base](style, color) in
                base?.instanceColor = color.color(for: style).cgColor
            }
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
     }
}
