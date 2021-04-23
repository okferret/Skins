//
//  UIColor+Extensions.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation
import UIKit

extension UIColor {
    
    /// color from hex string
    /// - Parameter contents: String
    internal convenience init(hex contents: String) {
        let alpha: CGFloat
        var hex: String
        if contents.contains("@") == true {
            let components = contents.components(separatedBy: "@")
            hex = components[0]
            alpha = CGFloat(Int.init(components[1]) ?? 100) / 100.0
        } else {
            alpha = 1.0
            hex = contents
        }
        
        hex = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
        guard hex.count == 3 || hex.count == 6 || hex.count == 8 else {
            self.init(white: 1.0, alpha: 0.0)
            return
        }
        
        if hex.count == 3 {
            for (index, char) in hex.enumerated() {
                hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
            }
        }
        guard let intCode = Int(hex, radix: 16) else {
            self.init(white: 1.0, alpha: 0.0)
            return
        }
        
        let red = CGFloat((intCode >> 16) & 0xFF) / 255.0
        let green = CGFloat((intCode >> 8) & 0xFF) / 255.0
        let blue = CGFloat((intCode) & 0xFF) / 255.0
        self.init(red: red, green: green, blue:  blue, alpha: alpha)
    }
}
