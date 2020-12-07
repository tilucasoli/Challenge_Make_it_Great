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
        app.buttons["Adicionar"].tap()
        app.staticTexts["😆"].tap()
        app.staticTexts["🥳"].tap()

        let olJohnNavigationBar = app.navigationBars["Olá John!"]
        olJohnNavigationBar.buttons["Back"].tap()
        olJohnNavigationBar.buttons["Olá John!"].tap()

    }
}
