//
//  CustomCell.swift
//  Midtermtask
//  Created by Bizhanov Madiyar on 28.10.2022.

import UIKit

class Cells: UITableViewCell {

    @IBOutlet weak var timeAlarm_label: UILabel!
    @IBOutlet weak var titleAlarm_label: UILabel!
    @IBOutlet weak var switch_label: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
