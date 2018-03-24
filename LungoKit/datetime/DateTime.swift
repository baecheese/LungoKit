//
//  DateTime.swift
//  LungoKit
//
//  Created by 배지영 on 2017. 12. 30..
//  Copyright © 2017년 LungoKit. All rights reserved.
//

import Foundation


open class DateTime : CustomStringConvertible {
    
    private let date:Date
    
    private init() {
        self.date = Date()
    }
    
    private init(date:Date) {
        self.date = date
    }
    
    public var timeIntervalSinceNow :TimeInterval {
        return self.date.timeIntervalSinceNow
    }
    
    public var description: String {
        return date.description
    }
    
    public static func now() -> DateTime {
        return DateTime()
    }
    
    public static func valueOf(date: Date) -> DateTime {
        return DateTime(date: date)
    }
    
    public static func valueOf(timeIntervalSinceNow: TimeInterval) -> DateTime {
        return DateTime(date: Date.init(timeIntervalSinceNow: timeIntervalSinceNow))
    }

    public func toDate() -> Date {
        return self.date
    }
    
    /** default locale ko_KR */
    public func format(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = LungoLocale.KO_KR.toLocale
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self.date)
    }
    
    public func format(_ format: String, locale: Locale) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self.date)
    }
    
    public func format(_ format: String, lungoLocale: LungoLocale) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = lungoLocale.toLocale
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self.date)
    }
    
    
}

