//
//  SKError.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation

/// SKError
internal struct SKError {
    internal let code: Int
    internal let message: String
    
    /// 构建
    /// - Parameters:
    ///   - code: 错误码
    ///   - message: String
    internal init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
    
    /// convenience
    /// - Parameter message: String
    internal init(_ message: String) {
        self.init(code: -90001, message: message)
    }
}

extension SKError: Error {
    
    /// localizedDescription
    internal var localizedDescription: String {
        return message
    }
}

