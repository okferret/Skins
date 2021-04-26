//
//  UISlider+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit.UISlider

extension SKCompatibleWrapper where Base: UISlider {
    
    /// The color used to tint the default minimum track images.
    public var minimumTrackTintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.minimumTrackTintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.minimumTrackTintColor = color.color(for: style)
            }))
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
    
    /// The color used to tint the default maximum track images.
    public var maximumTrackTintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.maximumTrackTintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.maximumTrackTintColor = color.color(for: style)
            }))
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
    
    /// The color used to tint the default thumb images.
    public var thumbTintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.thumbTintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(entity: .color( color, { [weak base](style, color) in
                base?.thumbTintColor = color.color(for: style)
            }))
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
    
}
