//
//  SKCompatible.swift
//  Skins
//
//  Created by tramp on 2021/4/23.
//

import Foundation

/// SKCompatibleWrapper
public struct SKCompatibleWrapper<Base> {
    public let base: Base
    
    internal init(base: Base) {
        self.base = base
    }
}

/// SKCompatible
public protocol SKCompatible: AnyObject {}
extension SKCompatible {
    
    /// SKCompatibleWrapper<Self>
    public var skin: SKCompatibleWrapper<Self> {
        get { return .init(base: self) }
        set {}
    }
}

public protocol SKCompatibleValue {}
extension SKCompatibleValue {
    
    /// SKCompatibleWrapper<Self>
    public var skin: SKCompatibleWrapper<Self> {
        get { return .init(base: self) }
        set {}
    }
}

