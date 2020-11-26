//
//  ViewController.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 24/11/20.
//

import UIKit

class MonitoringViewController: UIViewController {

    let userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textColor = .green
        label.text = "Olá John"
        return label
    }()

    let calendarView = CalendarView()
    let monitoringStatus = MonitoringStatus()
    let goToForm = GoToForm()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupUserName()
        setupCalendarView()
        setupMonitoringStatus()
        setupGoToForm()
    }

    func setupUserName() {
        view.addSubview(userName)
        userName.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            userName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        ])
    }

    func setupCalendarView() {
        view.addSubview(calendarView)
        calendarView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 16),
            calendarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            calendarView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -34),
            calendarView.heightAnchor.constraint(equalToConstant: 267)
        ])
    }

    func setupMonitoringStatus() {
        view.addSubview(monitoringStatus)
        monitoringStatus.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            monitoringStatus.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 24),
            monitoringStatus.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            monitoringStatus.heightAnchor.constraint(equalToConstant: 51)
        ])
    }

    func setupGoToForm() {
        view.addSubview(goToForm)
        goToForm.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            goToForm.topAnchor.constraint(equalTo: monitoringStatus.bottomAnchor, constant: 40),
            goToForm.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            goToForm.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }

}
