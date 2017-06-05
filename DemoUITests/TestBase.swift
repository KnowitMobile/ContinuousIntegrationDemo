//
//  TestBase.swift
//  Demo
//
//  Created by Paul Griffin on 2017-06-05.
//  Copyright © 2017 Knowit. All rights reserved.
//

import XCTest

class TestBase: XCTestCase{
    
    var failiures = [String]()
    
    let exists = NSPredicate(format: "exists == 1")
    let notExists = NSPredicate(format: "exists == 0")
    
    let url = "https://hooks.slack.com/services/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"
    
    override func tearDown() {
        
        
        let device = UIDevice.current.localizedModel
        let os = UIDevice.current.systemVersion
        let isSuccess = testRun?.failureCount == 0
        
        let message = "\(device) \(os) \(name!) \(failiures.reduce(""){ $0.0+"\n"+$0.1 })"
        
        let jsonObject = [
            "attachments":[[
                "fallback": (isSuccess ? "Success " : "Fail ") + message,
                "title": message,
                "color": isSuccess ? "good" : "danger"
                ]]
            ]
        let json = JSONSerialization.data(withJSONObject: jsonObject, options: nil)
        if !isSuccess{//Only send if there was an error
            var request = URLRequest(url: URL(string: url)!)
            request.httpMethod = "POST"
            request.httpBody = json
            
            let task = URLSession.shared.dataTask(with: request)
            task.resume()
        }
        failiures = []
        super.tearDown()
    }
    
    override func recordFailure(withDescription description: String, inFile filePath: String, atLine lineNumber: UInt, expected: Bool) {
        failiures += ["Error: \(description)\nFile: \(filePath)\nLine: \(lineNumber)"]
        super.recordFailure(withDescription: description, inFile: filePath, atLine: lineNumber, expected: expected)
    }
    
}
