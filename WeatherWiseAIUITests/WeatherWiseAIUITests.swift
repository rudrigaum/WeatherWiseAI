//
//  WeatherWiseAIUITests.swift
//  WeatherWiseAIUITests
//
//  Created by Rodrigo Cerqueira Reis on 10/11/26.
//

import XCTest

final class WeatherWiseAIUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testExample() {
        let app = XCUIApplication()
        app.launch()
    }

    @MainActor
    func testLaunchPerformance() {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
