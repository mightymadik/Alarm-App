//
//  Alarm.swift
//  Midtermtask
//  Created by Bizhanov Madiyar on 28.10.2022.
import UIKit

class Alarm {
    var timesString: String?
    var notesString: String?
    var switched: Bool?
    
    init(timesString: String, notesString: String, isSwitched: Bool) {
        self.timesString = timesString
        self.notesString = notesString
        self.switched = isSwitched
    }
}
