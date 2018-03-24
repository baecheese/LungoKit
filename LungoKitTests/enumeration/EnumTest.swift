//
//  EnumTest.swift
//  HttpTesterTests
//
//  Created by 배지영 on 2017. 12. 28..
//  Copyright © 2017년 baecheese. All rights reserved.
//

import XCTest
@testable import LungoKit

class EnumTest: XCTestCase {
    
    enum HTTPMethod : LungoEnum {
        
        case POST
        case GET
        
        static var allValues: [HTTPMethod] {
            return [POST, GET]
        }
    }
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEnum() {
        XCTAssert("POST" == HTTPMethod.POST.name)
        XCTAssert("GET" == HTTPMethod.GET.name)
        XCTAssert(HTTPMethod.GET == HTTPMethod.valueOf(name: "GET"))
        XCTAssert(HTTPMethod.POST == HTTPMethod.valueOf(name: "POST"))
        XCTAssert(HTTPMethod.count == 2)
    }
    
    func testP() {
        print(HTTPMethod.allValues)
    }
    
}







