//
//  LEnum.swift
//  LungoKit
//
//  Created by 배지영 on 2017. 12. 30..
//  Copyright © 2017년 LungoKit. All rights reserved.
//

import Foundation

public protocol LungoEnum {
    static var allValues: [Self] { get }
    static var count: Int { get }
    var name: String { get }
    
    static func valueOf(name:String) -> Self?
    
}

public extension LungoEnum {
    var name: String {
        return "\(self)"
    }
    
    static var count: Int {
        return allValues.count
    }
    
    static func valueOf(name:String) -> Self? {
        for value in allValues {
            if (value.name == name) {
                return value;
            }
        }
        return nil
    }
    
}
