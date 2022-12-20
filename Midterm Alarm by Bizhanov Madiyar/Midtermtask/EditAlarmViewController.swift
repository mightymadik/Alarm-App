//
//  EditAlarmViewController.swift
//  Midtermtask
//  Created by Bizhanov Madiyar on 28.10.2022.
import UIKit

class EditAlarmViewController: UIViewController {

    var timeAlarm: String?
    var titleAlarm: String?
    var changeProtocol: ChangeAlarm?
    var deleteProtocol: DeleteAlarm?
    var index = 0
    
    @IBOutlet weak var myPicker: UIDatePicker!
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Change Alarm"
        myTextField.delegate = self
        myTextField.text = titleAlarm
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        deleteProtocol?.deleteAlarm(index: index)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeAction(_ sender: UIButton) {
        let timeTable = myPicker.calendar.dateComponents([.hour, .minute], from: myPicker.date)
        var hour = ""
        var minute = ""
        if timeTable.hour! < 10 {
            hour = "0\(timeTable.hour!)"
        }
        if timeTable.hour! >= 10 {
            hour = "\(timeTable.hour!)"
        }
        if timeTable.minute! < 10 {
            minute = "0\(timeTable.minute!)"
        }
        if timeTable.minute! >= 10 {
            minute = "\(timeTable.minute!)"
        }
        timeAlarm = "\(hour) : \(minute)"
        changeProtocol?.changeAlarm(timesString: timeAlarm!, notesString: myTextField.text!, index: index)
        navigationController?.popViewController(animated: true)
    }
}

extension EditAlarmViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
