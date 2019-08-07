//
//  AddViewController.swift
//  Practice
//
//  Created by RomaDUlbich on 8/7/19.
//  Copyright © 2019 Oleg1. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    var delegate: AddTask?
    @IBOutlet weak var taskNameOutl: UITextField!
    
    @IBAction func addAction(_ sender: Any) {
        if taskNameOutl.text != ""
        {
            delegate?.addTask(name: taskNameOutl.text!)
            taskNameOutl.text = ""
        }
        else{
            fatalError()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    

   

}
