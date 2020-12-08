//
//  UserModelTests.swift
//  Make it GreatTests
//
//  Created by Ana Karolina Costa da Silva on 08/12/20.
//

import XCTest
@testable import Make_it_Great

class UserModelTests: XCTestCase {
    
    func test_createUser_data_True() {
         // given
           let sut = UserModel()
           let date = "01-12-2020"
           guard let lastDate = DateFormatter().date(from: date) else { return }
        // when
           let output = sut.createUser(name: "Joao", dayLastDrink: lastDate)

       //then
           XCTAssertTrue(output)
       }

       func test_readUser_data_user() {
           // given
           let sut = UserModel()
           // when
           let output = sut.readUser()
           // then
           XCTAssertNotNil(output)
       }

       func test_readDaily_date_daily() {
           // given
           let sut = UserModel()
           let date = "01-12-2020"
           guard let lastDate = DateFormatter().date(from: date) else { return }
           // when
           let output = sut.readDaily(actualDate: lastDate)
           // then
           XCTAssertNotNil(output)
       }

        func test_createDaily_daily_true() {
            // given
            let sut = UserModel()
            // when
            let output = sut.createDaily(mood: 1, date: Date(), hadDrink: 2)
            // then
            XCTAssertTrue(output)
        }
    
        func test_readDaily_daily_notNil() {
            //given
            let sut = UserModel()
            let daily = UserModel().createDaily(mood: 1, date: Date(), hadDrink: 4)
            // when
            let output = sut.readDaily(actualDate: Date())
            // then
            XCTAssertNotNil(output)
        }

        func test_deleteDaily_date_true() {
            // given
            let sut = UserModel()
            let daily = UserModel().createDaily(mood: 1, date: Date(), hadDrink: 3)
            // when
            let output = sut.deleteDaily(dailyDate: Date())
            // then
            XCTAssertTrue(output)
        }
}
