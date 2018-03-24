//
//  LungoClass.swift
//  LungoKit
//
//  Created by 배지영 on 2017. 12. 31..
//  Copyright © 2017년 LungoKit. All rights reserved.
//

import Foundation

public protocol LungoType : Hashable, CustomStringConvertible {
    static func ==(lhs: Self, rhs: Self) -> Bool
    var hashValue: Int {get}
    var description: String {get}
    
}

class Person : NSObject {
    let name:String
    
    init(_ name:String) {
        self.name = name
    }
    
}

class Pet : LungoType {
    
    
    let name:String
    
    init(_ name:String) {
        self.name = name
    }
    
    static func ==(lhs: Pet, rhs: Pet) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    var hashValue: Int {
        return name.hashValue
    }
    
    var description: String {
        return "{\"name\":\"\(self.name)\""
    }
    
}
