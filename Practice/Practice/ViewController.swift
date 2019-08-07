//
//  ViewController.swift
//  Practice
//
//  Created by RomaDUlbich on 8/6/19.
//  Copyright © 2019 Oleg1. All rights reserved.
//

import UIKit

protocol AddTask {
    func addTask(name: String)
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, CheckboxChange {
    var tasks = [Task]()
    
    var delegate = AddTask?.self
    
    func addTask(name: String) {
        tasks.append(Task(name2: name))
        tableView.reloadData()
    }
    
    func checkBtn(checked: Bool, index: Int) {
        tasks[index].checked = checked
        tableView.reloadData()
    }
 
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tasks.append(Task(name2: "test"))
        
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewcontroler = segue.destination as! AddViewController
        viewcontroler.delegate = self
    }
    
    
    
    
    
    
    
    //MARK - TableviewSetup
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "CellName", for: indexPath) as? TaskTableViewCell else{
            fatalError()
        }
        cell.taskName.text = tasks[indexPath.row].name
        if tasks[indexPath.row].checked {
            cell.checkOutlet.setBackgroundImage(UIImage (named: "checkbox"), for: UIControl.State.normal)}
            else{
                cell.checkOutlet.setBackgroundImage(UIImage (named: "checkboxUnselected"), for: UIControl.State.normal)
        }
        cell.delegate = self 
        cell.index = indexPath.row
        cell.tasks = tasks
    
        
        
        return cell
        
    }
    
    
    
    
    //MARK - In viev add
    
    @IBOutlet weak var currentTaskName: UITextField!
    
    @IBAction func addTaskBtn(_ sender: Any) {
        if currentTaskName.text != ""
        {
        addTask(name: currentTaskName.text!)
        currentTaskName.text = ""
        }
        else{
            fatalError()
        }
        
        
    }
    
    
    
    
    
    
}
