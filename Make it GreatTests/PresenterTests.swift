//
//  PresenterTests.swift
//  Make it GreatTests
//
//  Created by Ana Karolina Costa da Silva on 08/12/20.
//

import XCTest
@testable import Make_it_Great

class PresenterTests: XCTestCase {

    func test_requestDaysWithoutDrunk_day8() {
            // given
            let sut = MonitoringPresenter()
            let lastDate = "01-12-2020"
            guard let date1 = DateFormatter().date(from: lastDate) else { return }
            let input = UserModel().createUser(name: "João", dayLastDrink: date1)

            // when

            let output1 = sut.requestDaysWithoutDrunk()
            print(output1)

            // then
            XCTAssertEqual(output1, 8)
        }

        func test_formWasSubmited_insertDate_True() {
            // given
            let sut = MonitoringPresenter()
            let lastDate = "01-12-2020"
            guard let input = DateFormatter().date(from: lastDate) else { return }

            // when

            let output1 = sut.formWasSubmited(actualDate: input)

            // then
            XCTAssertTrue(output1)
        }


        func test_areYouDrunk_date_true(){
            // given
            let sut = MonitoringPresenter()
            let lastDate = "01-12-2020"
            guard let input = DateFormatter().date(from: lastDate) else { return }

            // when
            let output = sut.areYouDrunk(in: input)
            // then
            XCTAssertTrue(output)

        }

        func test_requiresUserName_notNil() {
            // given
            let sut = MonitoringPresenter()
            let lastDate = "01-12-2020"
            guard let input = DateFormatter().date(from: lastDate) else { return }
            let userCreate = UserModel().createUser(name: "Joao", dayLastDrink: input)
            // when
            let output = sut.requestUserName()
            // then
            XCTAssertNotNil(output)
        }

        func test_saveDaily_daily_true() {
            let sut = MonitoringPresenter()
            // when
            let output = sut.saveDaily(mood: 1, hadDrunk: 2)
            // then
            XCTAssertTrue(output)
        }

        func test_existsDaily_daily_true() {
            // given
            let sut = MonitoringPresenter()
            // when
            let output = sut.existsDaily()
            // then
            XCTAssertTrue(output)
        }
}
