//
//  Local.swift
//  LungoKit
//
//  Created by 배지영 on 2017. 12. 30..
//  Copyright © 2017년 LungoKit. All rights reserved.
//

import Foundation


public enum LungoLocale:String, LungoEnum {
    
    case KO_KR = "ko_KR"
    
    public static var allValues: [LungoLocale] {
        return [KO_KR]
    }
    
    public var toLocale: Locale {
        return Locale(identifier:self.rawValue)
    }
    
}
