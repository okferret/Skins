//
//  CATextLayer+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import QuartzCore

extension SKCompatibleWrapper where Base: CATextLayer {
    
    /* The color object used to draw the text. Defaults to opaque white.
     * Only used when the `string' property is not an NSAttributedString.
     * Animatable (Mac OS X 10.6 and later.) */
    public var foregroundColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.foregroundColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.foregroundColor = color.color(for: style).cgColor
            }))
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
}
