//
//  CAGradientLayer+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/26.
//

import Foundation
import QuartzCore

extension SKCompatibleWrapper where Base: CAGradientLayer {
    
    /* The array of CGColorRef objects defining the color of each gradient
     * stop. Defaults to nil. Animatable. */
    public var colors: [Skins.Color]? {
        get { nil }
        set {
            guard let colorKeys = newValue else {
                base.colors = nil
                return
            }
            let colors = colorKeys.compactMap { Skins.shared.color(for: $0) }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .colors(colors, {[weak base] (style, colors) in
                base?.colors = colors.map { $0.color(for: style).cgColor }
            }))
            Skins.shared.set((actionKey,action), for: base)
            action.run()
        }
    }
}
