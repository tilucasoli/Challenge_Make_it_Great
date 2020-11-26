//
//  CalendarVIew.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 25/11/20.
//

import UIKit
import JTAppleCalendar
// JTAppleCalendar has a behavior like collection view

class CalendarView: UIView {
    let calendarCollection = JTACMonthView()
    let formatter = DateFormatter()

    override init(frame: CGRect) {
        super.init(frame: frame)
        calendarCollection.calendarDelegate = self
        calendarCollection.calendarDataSource = self
        calendarCollection.register(DateCell.self, forCellWithReuseIdentifier: "dateCell")

        setupCalendarView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCalendarView() {
        addSubview(calendarCollection)
        calendarCollection.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            calendarCollection.topAnchor.constraint(equalTo: topAnchor),
            calendarCollection.rightAnchor.constraint(equalTo: rightAnchor),
            calendarCollection.leftAnchor.constraint(equalTo: leftAnchor),
            calendarCollection.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension CalendarView: JTACMonthViewDelegate{
    //Para que serve isso?
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as? DateCell
        cell?.dayLabel.text = cellState.text
    }

    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {

        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath)
        guard let validDateCell = cell as? DateCell else { return JTACDayCell()}
        validDateCell.dayLabel.text = cellState.text

        hiddenOutInDates(cellState: cellState, dateCell: validDateCell)

        return cell
    }

}

extension CalendarView: JTACMonthViewDataSource {
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale

        let startDate = formatter.date(from: "2020 01 01")!
        let endDate = formatter.date(from: "2020 12 31")!

        // detalhar isso
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 5,
                                                 calendar: .current,
                                                 generateInDates: .forAllMonths,
                                                 generateOutDates: .off,
                                                 firstDayOfWeek: .sunday,
                                                 hasStrictBoundaries: true)

        return parameters
    }
}

// Visual Func
extension CalendarView {
    func hiddenOutInDates(cellState: CellState, dateCell: DateCell){
        if cellState.dateBelongsTo == .thisMonth {
            dateCell.isHidden = false
        } else {
            dateCell.isHidden = true
        }
    }
}
