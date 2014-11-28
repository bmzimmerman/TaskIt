//
//  ViewController.swift
//  TaskIt
//
//  Created by Brandon Zimmerman on 11/24/14.
//  Copyright (c) 2014 Hammer Forged Games. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    
    var taskArray: [TaskModel] = []
    
    // init
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    // methods
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "showTaskDetail"
        {
            let destinationVC = segue.destinationViewController as TaskDetailViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow()!
            
            destinationVC.parentVC = self
            destinationVC.taskModel = taskArray[indexPath.row]
        }
        else if segue.identifier == "showAddTask"
        {
            let destinationVC = segue.destinationViewController as AddTaskViewController
            
            destinationVC.parentVC = self
        }
    }
    
    // IBAction
    
    @IBAction func addTask(sender: UIBarButtonItem)
    {
        performSegueWithIdentifier("showAddTask", sender: self)
    }
    
    // UIViewController
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        taskArray =
        [
            TaskModel(task: "Study Dutch", description: "Diminutives", date: NSDate.create(year: 1993, month: 9, day: 18)),
            TaskModel(task: "Do the laundry", description: "Don't forget to buy detergent after", date: NSDate.create(year: 2014, month: 4, day: 20)),
            TaskModel(task: "Make dinner", description: "Burgers", date: NSDate.create(year: 2008 , month: 11, day: 28))
        ]
    }
    
    override func viewDidAppear(animated: Bool)
    {
        taskArray = taskArray.sorted {
            (task1: TaskModel, task2: TaskModel) -> Bool in
            
            return task1.date.timeIntervalSince1970 < task2.date.timeIntervalSince1970
        }
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        let taskData = taskArray[indexPath.row]
        
        cell.taskLabel.text = taskData.task
        cell.descriptionLabel.text = taskData.description
        cell.dateLabel.text = taskData.date.toString()
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            taskArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        }
    }
    
    // UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        performSegueWithIdentifier("showTaskDetail", sender: self)
    }
}

