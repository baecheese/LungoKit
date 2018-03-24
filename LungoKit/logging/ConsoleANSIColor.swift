//
//  ConsoleANSIColor.swift
//  LungoKit
//
//  Created by 배지영 on 2017. 12. 30..
//  Copyright © 2017년 LungoKit. All rights reserved.
//

import Foundation

public enum ConsoleColor : String, LungoEnum {
    
    case WHITE = "\u{001B}[0;37m"
    case BLACK = "\u{001B}[0;30m"
    case RED = "\u{001B}[0;31m"
    case MAGENTA = "\u{001B}[0;35m"
    case YELLOW = "\u{001B}[0;33m"
    case GREEN = "\u{001B}[0;32m"
    case CYAN = "\u{001B}[0;36m"
    case BLUE = "\u{001B}[0;34m"
    
    public static var values: [ConsoleColor] {
        return [BLACK, RED, GREEN, YELLOW, BLUE, MAGENTA, CYAN, WHITE]
    }
    
}
