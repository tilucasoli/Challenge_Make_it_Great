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

    let monthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .green
        label.text = "December"
        return label
    }()

    let stackWeekLabels = StackWeekLabel()
    let calendarCollection = JTACMonthView()
    let formatter = DateFormatter()
    let presenter = MonitoringPresenter()
    var delegate: ViewPushViewControllerDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        calendarCollection.calendarDelegate = self
        calendarCollection.calendarDataSource = self
        calendarCollection.backgroundColor = .grayOne
        calendarCollection.register(DateCell.self, forCellWithReuseIdentifier: "dateCell")
        setupMonthLabel()
        setupStackWeekLabel()
        setupCalendarView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupMonthLabel() {
        addSubview(monthLabel)
        monthLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: topAnchor),
            monthLabel.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }

    func setupStackWeekLabel() {
        addSubview(stackWeekLabels)
        stackWeekLabels.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackWeekLabels.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 16),
            stackWeekLabels.rightAnchor.constraint(equalTo: rightAnchor),
            stackWeekLabels.leftAnchor.constraint(equalTo: leftAnchor, constant: 4)
        ])
    }

    func setupCalendarView() {
        addSubview(calendarCollection)
        calendarCollection.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            calendarCollection.topAnchor.constraint(equalTo: stackWeekLabels.bottomAnchor, constant: 13),
            calendarCollection.rightAnchor.constraint(equalTo: rightAnchor),
            calendarCollection.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            calendarCollection.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}

extension CalendarView: JTACMonthViewDelegate{
    //Para que serve isso?
    func calendar(_ calendar: JTACMonthView, willDisplay cell: JTACDayCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath) as? DateCell
        cell?.configure(cellState: cellState)
    }

    func calendar(_ calendar: JTACMonthView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTACDayCell {

        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "dateCell", for: indexPath)
        guard let validDateCell = cell as? DateCell else { return JTACDayCell()}

        validDateCell.configure(cellState: cellState)
        
        // Deve ir pra presenter
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale

        let testDate = formatter.date(from: "2020 12 01")!

        if date.getDateFormattedYearMonthDay() == Date().getDateFormattedYearMonthDay() {
            validDateCell.highlightedViewSelectableCurrentDay()
        }
        else if presenter.areYouDrunk(in: date) {
            validDateCell.highlightedViewSequenceDay()
        }
        else {
            validDateCell.highlightedViewNormalDay()
        }

        hiddenOutInDates(cellState: cellState, dateCell: validDateCell)

        return cell
    }

    func calendar(_ calendar: JTACMonthView, didSelectDate date: Date, cell: JTACDayCell?, cellState: CellState, indexPath: IndexPath) {
        delegate?.pushInformationViewController(date: date)
    }

}

extension CalendarView: JTACMonthViewDataSource {
    func configureCalendar(_ calendar: JTACMonthView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale

        let startDate = formatter.date(from: "2020 12 01")!
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
