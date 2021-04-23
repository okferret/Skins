//
//  SFSafariViewController+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import SafariServices

extension SKCompatibleWrapper where Base: SFSafariViewController {
    /** @abstract The preferred color to tint the background of the navigation bar and toolbar. If SFSafariViewController is in Private
     Browsing mode or is displaying an anti-phishing warning page, this color will be ignored. Changes made after the view controller
     has been presented will not be reflected.
     */
    @available(iOS 10.0, *)
    public var preferredBarTintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.preferredBarTintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(color: color) { [weak base](style, color) in
                base?.preferredBarTintColor = color.color(for: style)
            }
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
    
    
    /** @abstract The preferred color to tint the control buttons on the navigation bar and toolbar. If SFSafariViewController is in Private
     Browsing mode or is displaying an anti-phishing warning page, this color will be ignored. Changes made after the view controller
     has been presented will not be reflected.
     */
    @available(iOS 10.0, *)
    public var preferredControlTintColor: Skins.Color? {
        get { nil }
        set {
            guard let colorKey = newValue, let color = Skins.shared.color(for: colorKey) else {
                base.preferredControlTintColor = nil
                return
            }
            let actionKey: SKAction.Key = .init(string: #function)
            let action: SKAction = .init(color: color) { [weak base](style, color) in
                base?.preferredControlTintColor = color.color(for: style)
            }
            Skins.shared.set((actionKey, action), for: base)
            action.run()
        }
    }
}
