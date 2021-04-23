//
//  UISegmentedControl+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit.UISegmentedControl

extension SKCompatibleWrapper where Base: UISegmentedControl {
    
    /// selectedSegmentTintColor
    @available(iOS 13.0, *)
    public var selectedSegmentTintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.selectedSegmentTintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(color: color) { [weak base](style, color) in
                base?.selectedSegmentTintColor = color.color(for: style)
            }
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
}
