//
//  LoggerTest.swift
//  LungoKitTests
//
//  Created by 배지영 on 2017. 12. 30..
//  Copyright © 2017년 LungoKit. All rights reserved.
//

import XCTest
@testable import LungoKit

class LoggerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    let log = LungoLogger()
    
    func testConsoleLog() {
        log.debug("this is debug log")
        log.info("this is info log")
        log.warn("this is warn log")
        log.error("this is error log")
    }
    
}
