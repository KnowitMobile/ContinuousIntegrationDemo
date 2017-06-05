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
        
        //Make sure the button works
        
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        app.buttons["Important button"].tap()
        XCTAssert( app.staticTexts["Works"].exists )
        app.navigationBars["UIView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        
        
    
    }
    
}
