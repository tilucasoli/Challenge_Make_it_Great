//
//  Date.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 30/11/20.
//

import Foundation

extension Date {
    func getDateFormattedYearMonthDay() -> String {
        let format = DateFormatter()

        format.dateFormat = "yyyy-MM-dd"
        let formattedDate = format.string(from: self)
        
        return formattedDate
    }
}
