//
//  Skins+Extensions.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation

extension Skins {
    
    /// Color
    public struct Color: Hashable {
        internal var rawValue: String
        
        /// 构建
        /// - Parameter rawValue: String
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}
