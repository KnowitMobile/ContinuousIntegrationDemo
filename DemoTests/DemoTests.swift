//
//  DemoTests.swift
//  DemoTests
//
//  Created by Paul Griffin on 2017-06-05.
//  Copyright © 2017 Knowit. All rights reserved.
//

import XCTest
@testable import Demo

class DemoTests: XCTestCase {
    
    func testNameValidation() {
        
        // failing example
        XCTAssert(NameInputViewController.validateName(name: "test") == false)
        
        //working example
        XCTAssert(NameInputViewController.validateName(name: "test test"))
        
    }
    
}
