//
//  Logger.swift
//  LungoKit
//
//  Created by 배지영 on 2017. 12. 30..
//  Copyright © 2017년 LungoKit. All rights reserved.
//

import Foundation

enum LogLevel : Int, LungoEnum {
    
    case DEBUG = 0
    case INFO = 1
    case WARN = 2
    case ERROR = 3
    
    static var allValues: [LogLevel] {
        return [DEBUG, INFO, WARN, ERROR]
    }
    
    func colorticon() -> String {
        switch(self) {
        case .DEBUG:
            return "💚"
        case .INFO:
            return "💙"
        case .WARN:
            return "💛"
        case .ERROR:
            return "❤️"
        }
    }
    
}

protocol Appender {
    func append(_ log: String)
}

protocol AsyncAppender : Appender {
    func flush()
}

class ConsoleAppender: Appender {
    
    func append(_ log: String) {
        print(log)
    }

}


open class LungoLogger {
    
    private let appenders: [LogLevel:[Appender]]
    
    private let logDateFormat: String
    
    init() {
        self.logDateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        self.appenders = [
            LogLevel.DEBUG:[ConsoleAppender()]
            , LogLevel.INFO:[ConsoleAppender()]
            , LogLevel.WARN:[ConsoleAppender()]
            , LogLevel.ERROR:[ConsoleAppender()]
        ]
    }
    
    init(logDateFormat:String) {
        self.logDateFormat = logDateFormat
        self.appenders = [
            LogLevel.DEBUG:[ConsoleAppender()]
            , LogLevel.INFO:[ConsoleAppender()]
            , LogLevel.WARN:[ConsoleAppender()]
            , LogLevel.ERROR:[ConsoleAppender()]
        ]
    }
    
    init(logDateFormat:String, appenders:[LogLevel:[Appender]]) {
        self.logDateFormat = logDateFormat
        self.appenders = appenders
    }
    
    public func debug(funcName: String = #function, lineNum: Int = #line, fileName: String = #file, _ message: String) {
        self.write(logLevel: .DEBUG, funcName: funcName, lineNum: lineNum, fileName: fileName, message: message)
    }
    
    public func info(funcName: String = #function, lineNum: Int = #line, fileName: String = #file, _ message: String) {
        self.write(logLevel: .INFO, funcName: funcName, lineNum: lineNum, fileName: fileName, message: message)
    }
    
    public func warn(funcName: String = #function, lineNum: Int = #line, fileName: String = #file, _ message: String) {
        self.write(logLevel: .WARN, funcName: funcName, lineNum: lineNum, fileName: fileName, message: message)
    }
    
    public func error(funcName: String = #function, lineNum: Int = #line, fileName: String = #file, _ message: String) {
        self.write(logLevel: .ERROR, funcName: funcName, lineNum: lineNum, fileName: fileName, message: message)
    }
    
    private func write(logLevel:LogLevel, funcName: String, lineNum: Int, fileName: String, message: String) {
        let datetimeString = DateTime.now().format(logDateFormat)
        let fileNameTokens = fileName.components(separatedBy: "/")
        let simpleFileName = fileNameTokens[fileNameTokens.count - 1]
        var log:String? = nil
        for appender in self.appenders[logLevel]! {
            if log == nil {
                 log = "\(datetimeString) \(simpleFileName):\(lineNum)#\(funcName) [\(logLevel)] - \(message)"
            }
            if (appender is ConsoleAppender) {
                appender.append(logLevel.colorticon() + log!)
            } else {
                appender.append(log!)
            }
        }
    }
    
}

