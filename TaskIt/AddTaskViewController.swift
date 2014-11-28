//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Brandon Zimmerman on 11/28/14.
//  Copyright (c) 2014 Hammer Forged Games. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController
{
    var parentVC: TaskViewController!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        println("Add Task VC viewDidLoad()")
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func addTask(sender: UIBarButtonItem)
    {
        var newTask = TaskModel(
            task:        taskTextField.text,
            description: descriptionTextField.text,
            date:        datePicker.date
        )
        parentVC.taskArray.append(newTask)
        
        parentVC.tableView.reloadData()
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
