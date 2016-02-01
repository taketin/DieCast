//
//  DieCastTests.swift
//  DieCastTests
//
//  Created by Takeshita Hidenori on 2016/02/02.
//  Copyright © 2016年 taketin. All rights reserved.
//

import XCTest

class DieCastTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testInitOfIntType() {
        let diecast = DieCast(material: 1234567890)
        XCTAssertNotNil(diecast, "DieCast can convert from int to image")
    }

    func testInitOfCustomIntType() {
        let diecast = DieCast(material: 1234567890, type: IntCast.Custom, filenamePrefix: "test")
        XCTAssertNotNil(diecast, "DieCast can convert from int to custom image")
    }

    func testPressOfDigitalIntType() {
        let diecastView = DieCast(material: 1234567890)!.press()
        XCTAssertTrue(diecastView.subviews.count == 10, "DieCast can press to int type")
    }
}
