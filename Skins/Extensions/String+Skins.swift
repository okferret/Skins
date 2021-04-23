//
//  String+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit

extension String: SKCompatibleValue {}
extension SKCompatibleWrapper where Base == String {
    
    /// toColor
    /// - Returns: UIColor
    internal func toColor() -> UIColor {
        return .init(hex: base)
    }
}
