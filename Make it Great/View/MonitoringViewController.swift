//
//  ViewController.swift
//  Make it Great
//
//  Created by Lucas Oliveira on 24/11/20.
//

import UIKit

class MonitoringViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let calendarView = CalendarView()
        view.addSubview(calendarView)
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calendarView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        calendarView.heightAnchor.constraint(equalToConstant: 227).isActive = true
        calendarView.widthAnchor.constraint(equalToConstant: 306).isActive = true

        calendarView.calendarCollection.backgroundColor = .white
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
