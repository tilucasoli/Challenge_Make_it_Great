//
//  InitialViewUITest.swift
//  MakeItGreatUITests
//
//  Created by Ana Karolina Costa da Silva on 07/12/20.
//

import XCTest
@testable import Make_it_Great

class InitialViewUITest: XCTestCase {
    func test_monitoringButtons_actionables(){
        let app = XCUIApplication()
        app.launchArguments = ["-reset"]
        app.launch()

        let _ = XCUIApplication()

        let firstButton = app.buttons["Adicionar"]
        XCTAssertTrue(firstButton.isHittable)
        firstButton.tap()

        let secondButton = app.staticTexts["😆"]
        XCTAssertTrue(secondButton.isHittable)
        secondButton.tap()

        let lastButton = app.staticTexts["🥳"]
        XCTAssertTrue(lastButton.isHittable)
        lastButton.tap()

        let olJohnNavigationBar = app.navigationBars["Olá John!"]

        let backButtonPage2 = olJohnNavigationBar.buttons["Back"]
        XCTAssertTrue(backButtonPage2.isHittable)
        backButtonPage2.tap()

        let backButtonPage1 = olJohnNavigationBar.buttons["Olá John!"]
        XCTAssertTrue(backButtonPage1.isHittable)
        backButtonPage1.tap()

    }
}
