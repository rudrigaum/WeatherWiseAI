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
    func testHomeActionsAndTabNavigation() {
        let app = XCUIApplication()
        app.launch()

        let homeGreeting = app.staticTexts["Bom dia!"]

        XCTAssertTrue(
            homeGreeting.waitForExistence(timeout: 10)
        )

        let cityButton = app.buttons[
            "Selecionar cidade: Salvador, BA"
        ]

        XCTAssertTrue(cityButton.exists)
        cityButton.tap()

        let cityAlert = app.alerts["Selecionar cidade"]

        XCTAssertTrue(
            cityAlert.waitForExistence(timeout: 5)
        )

        cityAlert.buttons["Entendi"].tap()

        let locationButton = app.buttons["Minha localização"]

        XCTAssertTrue(locationButton.exists)
        locationButton.tap()

        let locationAlert = app.alerts["Minha localização"]

        XCTAssertTrue(
            locationAlert.waitForExistence(timeout: 5)
        )

        locationAlert.buttons["Entendi"].tap()

        let planningButton = app.buttons["Planejar com IA"]

        XCTAssertTrue(planningButton.exists)
        planningButton.tap()

        XCTAssertTrue(
            app.staticTexts["Planejador em desenvolvimento"]
                .waitForExistence(timeout: 5)
        )

        let forecastTab = app.tabBars.buttons["Previsão"]

        XCTAssertTrue(forecastTab.exists)
        forecastTab.tap()

        XCTAssertTrue(
            app.staticTexts["Previsão em desenvolvimento"]
                .waitForExistence(timeout: 5)
        )

        let homeTab = app.tabBars.buttons["Início"]

        XCTAssertTrue(homeTab.exists)
        homeTab.tap()

        XCTAssertTrue(
            homeGreeting.waitForExistence(timeout: 5)
        )
    }
}
