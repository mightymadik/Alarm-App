//
//  NewAlarmViewController.swift
//  Midtermtask
//  Created by Bizhanov Madiyar on 28.10.2022.
import UIKit

class AddAlarmViewController: UIViewController {
    
    var myProtocol: AddAlarm?
    @IBOutlet weak var myPicker: UIDatePicker!
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add Alarm"
        myTextField.delegate = self
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        let times = myPicker.calendar.dateComponents([.hour, .minute], from: myPicker.date)
        var alarmHours = ""
        var alarmMinutes = ""
        if times.hour! < 10 {
            alarmHours = "0\(times.hour!)"
        }
        if times.hour! >= 10 {
            alarmHours = "\(times.hour!)"
        }
        if times.minute! < 10 {
            alarmMinutes = "0\(times.minute!)"
        }
        if times.minute! >= 10 {
            alarmMinutes = "\(times.minute!)"
        }
        let timesString = "\(alarmHours) : \(alarmMinutes)"
        myProtocol?.addAlarm(timesString: timesString, notesString: myTextField.text!, isSwitched: false)
        navigationController?.popViewController(animated: true)
    }
    
}

extension AddAlarmViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
