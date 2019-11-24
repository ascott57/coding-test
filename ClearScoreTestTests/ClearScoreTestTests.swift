//
//  ClearScoreTestTests.swift
//  ClearScoreTestTests
//
//  Created by Anthony Scott on 2019/11/21.
//
//  As a minimum, we test the API call & test the results for sanity.

import XCTest
@testable import ClearScoreTest

class ClearScoreTestTests: XCTestCase {

    func testAPICall() {
        let url = NSURL(string: Constants.creditURL)!
        let asyncExpectation = expectation(description: "Wait for \(url) to load.")
        let apiManager = APIManager()
        var returnedValue: Int = 0
        var returnedMinValue: Int = 0
        var returnedMaxValue: Int = 0
        var error: Bool = false
        
        apiManager.getScore(success: { value, minValue, maxValue in
            returnedValue = value
            returnedMinValue = minValue
            returnedMaxValue = maxValue
            asyncExpectation.fulfill()
        }, failure: {
            error = true
            asyncExpectation.fulfill()
        })

        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssert(error == false)
        XCTAssert(returnedValue >= returnedMinValue)
        XCTAssert(returnedValue <= returnedMaxValue)

    }

}
