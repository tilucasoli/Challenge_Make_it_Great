//
//  ViewController.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 24/11/20.
//

import UIKit

class MonitoringViewController: UIViewController {
    let presenter = MonitoringPresenter()

    lazy var userName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Brown-Bold", size: 32)
        label.textColor = .grayThree
        label.text = presenter.userNameCongratulation
        return label
    }()

    let calendarView = CalendarView()
    lazy var monitoringStatus = MonitoringStatus(lastDayDrunk: presenter.dayWithoutDrunkString)
    let goToForm = GoToForm()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayOne

        navigationItem.hidesBackButton = true

        setupNavigationController()
//        setupUserName()
        setupCalendarView()
        setupMonitoringStatus()
        setupGoToForm()
        goToForm.delegate = self
        calendarView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        let navController = navigationController as? CustomNavigationController
        navController?.progressLabel.text = ""
        hideGotoForm()
    }

    func hideGotoForm() {
        goToForm.isHidden = presenter.existsDaily()
    }
    
    func setupNavigationController() {
        title = presenter.userNameCongratulation
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setupUserName() {
        view.addSubview(userName)
        userName.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 56),
            userName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        ])
    }

    func setupCalendarView() {
        view.addSubview(calendarView)
        calendarView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            calendarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            calendarView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -34),
            calendarView.heightAnchor.constraint(equalToConstant: 267)
        ])
    }

    func setupMonitoringStatus() {
        view.addSubview(monitoringStatus)
        monitoringStatus.translatesAutoresizingMaskIntoConstraints = false

        monitoringStatus.isHidden = presenter.requestDaysWithoutDrunk() == 0

        NSLayoutConstraint.activate([
            monitoringStatus.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 24),
            monitoringStatus.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            monitoringStatus.heightAnchor.constraint(equalToConstant: 55)
        ])
    }

    func setupGoToForm() {
        view.addSubview(goToForm)
        goToForm.translatesAutoresizingMaskIntoConstraints = false

        goToForm.isHidden = presenter.formWasSubmited(actualDate: Date())

        if monitoringStatus.isHidden {
            NSLayoutConstraint.activate([
                goToForm.topAnchor.constraint(lessThanOrEqualTo: calendarView.bottomAnchor, constant: 32),
                goToForm.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                goToForm.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
            ])
        } else {
            NSLayoutConstraint.activate([
                goToForm.topAnchor.constraint(lessThanOrEqualTo: monitoringStatus.bottomAnchor, constant: 32),
                goToForm.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                goToForm.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
            ])
        }

    }
}
extension MonitoringViewController: ViewPushViewControllerDelegate {

    func pushInformationViewController(date: Date) {
        if let daily = presenter.getDaily(date: date) {
            let informationController = InformationViewController()
            informationController.daily = daily
            informationController.delegate = self
            let navigation = UINavigationController(rootViewController: informationController)
            navigation.overrideUserInterfaceStyle = .light
            navigationController?.present(navigation, animated: true)
        } else {
            print("Sem daily!")
        }
    }

    func pushFormViewController() {
        let newVC = HumorViewController(titleText: "Como você está se sentindo hoje?", descriptionText: "Usamos esse dados para te ajudar a monitorar seu humor")
        navigationController?.pushViewController(newVC, animated: true)
    }

    func deleteDaily(date: Date) -> Bool{
        if presenter.deleteDaily(date: date) {
            hideGotoForm()
            return true
        } else {
            return false
        }
    }
}
