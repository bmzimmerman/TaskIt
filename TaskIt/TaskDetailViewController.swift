//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Brandon Zimmerman on 11/28/14.
//  Copyright (c) 2014 Hammer Forged Games. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController
{
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var parentVC: TaskViewController!
    
    var taskModel: TaskModel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        taskTextField.text = taskModel.task
        descriptionTextField.text = taskModel.description
        datePicker.date = taskModel.date
        
        println("Task Detail VC viewDidLoad()")
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: AnyObject)
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func saveTask(sender: AnyObject)
    {
        let newTaskModel = TaskModel(
            task:        taskTextField.text,
            description: descriptionTextField.text,
            date:        datePicker.date
        )
        
        parentVC.taskArray[parentVC.tableView.indexPathForSelectedRow()!.row] = newTaskModel
        
        parentVC.tableView.reloadData()
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
