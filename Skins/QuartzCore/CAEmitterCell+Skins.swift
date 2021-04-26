//
//  CAEmitterCell+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import QuartzCore

extension SKCompatibleWrapper where Base: CAEmitterCell {
    
    /* The mean color of each emitted object, and the range from that mean
     * color. `color' defaults to opaque white, `colorRange' to (0, 0, 0,
     * 0). Animatable. */
    public var color: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.color = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.color = color.color(for: style).cgColor
            }))
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
    
}
