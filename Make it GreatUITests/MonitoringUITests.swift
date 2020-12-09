//
//  MonitoringUITests.swift
//  Make it GreatUITests
//
//  Created by Ana Karolina Costa da Silva on 08/12/20.
//

import XCTest

class MonitoringUITests: XCTestCase {
    
    func test_onboardingButtons_actionables() {
         let app = XCUIApplication()
         app.launchArguments = ["-reset"]
         app.launch()

        let continueStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Continue"]/*[[".buttons[\"Continue\"].staticTexts[\"Continue\"]",".staticTexts[\"Continue\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        continueStaticText.tap()
        app.textFields["Ex: Jones"].tap()
        continueStaticText.tap()

        let adicionar = app.buttons["Adicionar"]
        XCTAssertTrue(adicionar.isHittable)
        adicionar.tap()

        let humor = app.staticTexts["😆"]
        XCTAssertTrue(humor.isHittable)
        humor.tap()

        let bebida = app.staticTexts["🥳"]
        XCTAssertTrue(bebida.isHittable)
        bebida.tap()

    }

    func test_backButton_actionables() {
        let app = XCUIApplication()
        app.launchArguments = ["-reset"]
        app.launch()

        let continueStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Continue"]/*[[".buttons[\"Continue\"].staticTexts[\"Continue\"]",".staticTexts[\"Continue\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        continueStaticText.tap()
        app.textFields["Ex: Jones"].tap()
        continueStaticText.tap()
        app.buttons["Adicionar"].tap()
        app.staticTexts["😍"].tap()

        let olNavigationBar = app.navigationBars["Olá, !"]
        olNavigationBar.buttons["Back"].tap()
        olNavigationBar.buttons["Olá, !"].tap()
        
    }

}
