//
//  TaskTableViewCell.swift
//  Practice
//
//  Created by RomaDUlbich on 8/7/19.
//  Copyright © 2019 Oleg1. All rights reserved.
//

import UIKit


protocol CheckboxChange {
    func checkBtn(checked : Bool,index: Int)
    
}

class TaskTableViewCell: UITableViewCell {
    
    @IBAction func checkAction(_ sender: Any) {
        if tasks[index!].checked{
            delegate?.checkBtn(checked: false, index: index!)
        }
        else {
            delegate?.checkBtn(checked: true, index: index!)
        }
    }
    
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var checkOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var delegate : CheckboxChange?
    var index : Int?
    var tasks = [Task]()
}
