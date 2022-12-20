//
//  ViewController.swift
//  Midtermtask
//  Created by Bizhanov Madiyar on 28.10.2022.

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var alarm = [
        Alarm.init(timesString: "10:00", notesString: "Mr.Darkhan's Lecture", isSwitched: true),
        Alarm.init(timesString: "1:00", notesString: "IOS practice", isSwitched: true),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Alarms"
        
    }
    
    @IBAction func addAction(_ sender: UIBarButtonItem) {
        let addVC = self.storyboard?.instantiateViewController(withIdentifier: "NewAlarmViewController") as? AddAlarmViewController
        addVC?.myProtocol = self
        navigationController?.pushViewController(addVC!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        alarm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? Cells
        cell?.timeAlarm_label.text = alarm[indexPath.row].timesString
        cell?.titleAlarm_label.text = alarm[indexPath.row].notesString
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            alarm.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = myTableView.indexPathForSelectedRow?.row
        let destination = segue.destination as! EditAlarmViewController
        destination.timeAlarm = alarm[index!].timesString
        destination.titleAlarm = alarm[index!].notesString
        destination.index = index!
        destination.changeProtocol = self
        destination.deleteProtocol = self

    }
}

extension ViewController: AddAlarm {
    func addAlarm(timesString: String, notesString: String, isSwitched: Bool) {
        let addingAlarm = Alarm.init(timesString: timesString, notesString: notesString, isSwitched: false)
        alarm.append(addingAlarm)
        myTableView.reloadData()
    }
}

extension ViewController: ChangeAlarm {
    func changeAlarm(timesString: String, notesString: String, index: Int) {
        alarm[index].timesString = timesString
        alarm[index].notesString = notesString
        myTableView.reloadData()
    }
}

extension ViewController: DeleteAlarm {
    func deleteAlarm(index: Int) {
        alarm.remove(at: index)
        myTableView.reloadData()
    }
}
