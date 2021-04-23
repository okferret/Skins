//
//  NSLock+Skins.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation

extension NSLock: SKCompatible {}
extension SKCompatibleWrapper where Base: NSLock {
    
    /// safe execute bock
    /// - Parameter block: block: () -> Void
    internal func safe(_ block: () -> Void) {
        base.lock()
        block()
        base.unlock()
    }
    
    /// safe execute bock
    /// - Parameter block: block: () -> T
    /// - Returns: T
    internal func safe<T>(_ block: () -> T) -> T {
        base.lock()
        let value = block()
        base.unlock()
        return value
    }
}
