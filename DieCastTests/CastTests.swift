//
//  CastTests.swift
//  DieCast
//
//  Created by Takeshita Hidenori on 2016/02/02.
//  Copyright © 2016年 taketin. All rights reserved.
//

import XCTest

class CastTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testIntDigitalTypeCast() {
        let utility = CastUtility(type: IntCast.digital, filenamePrefix: nil)
        XCTAssertNotNil(utility.type as? IntCast, "Cast type should be IntCast")
        XCTAssertEqual(utility.filenamePrefix, "diecast_digital_", "Filename prefix should be 'diecast_digital_'")
        XCTAssertEqual(utility.defaultMagnification, 0.1, "Default magnification should be 0.1")
        XCTAssertFalse(utility.isCustomType, "IsCustomType should be false")
    }

    func testIntCustomTypeCast() {
        let utility = CastUtility(type: IntCast.custom, filenamePrefix: "test_prefix_")
        XCTAssertNotNil(utility.type as? IntCast, "Cast type should be IntCast")
        XCTAssertEqual(utility.filenamePrefix, "test_prefix_", "Filename prefix should be 'test_prefix_'")
        XCTAssertEqual(utility.defaultMagnification, 1.0, "Default magnification should be 1.0")
        XCTAssertTrue(utility.isCustomType, "IsCustomType should be true")
    }
}
