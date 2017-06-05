//
//  DemoUITests.swift
//  DemoUITests
//
//  Created by Paul Griffin on 2017-06-02.
//  Copyright © 2017 Knowit. All rights reserved.
//

import XCTest

class DemoUITests: TestBase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testExample() {
        
        //Make sure the button and validation error works
        
        
        let app = XCUIApplication()
        let textField = app.textFields.element(boundBy: 0)
        
        textField.tap()
        textField.typeText("test")
        app.buttons["Submit"].tap()
        XCTAssert(app.staticTexts["Enter first and last name"].exists)
        
        
        textField.typeText(" test")
        app.buttons["Submit"].tap()
        
        XCTAssert(app.staticTexts["Works"].exists)
        app.navigationBars["UIView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        
        XCTAssert(app.staticTexts["Enter your name"].exists)
    }
    
}
