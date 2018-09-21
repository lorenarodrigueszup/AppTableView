//
//  ViewController.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 13/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DetailsViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!


    var task : Task?
    var taskManager : TaskManager = TaskManager()
    
    func didUpdate(task: Task) {
        taskManager.saveOrUpdate(task: task)
        tableView.reloadData()
    }
    
    func shouldDeleteTask(task: Task) {
        let _ = taskManager.deleteTask(task: task)
        
        
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")!
        if let cell = cell as? TaskTableViewCell {
            cell.nameTask.text = taskManager.tasks[indexPath.row].nameTask
            cell.dateTask.text = Task.stringFromDate(date: taskManager.tasks[indexPath.row].date)
            
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        task = taskManager.tasks[indexPath.row]
        performSegue(withIdentifier: "ShowTaskSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTaskSegue"
        {
            if let destinationVC = segue.destination as? DetailsView {
                destinationVC.task = task
                destinationVC.delegate = self
            }
        }
        
    }

    @IBAction func buttonCriate(_ sender: Any) {
        task =  Task()
        performSegue(withIdentifier: "ShowTaskSegue", sender: self)
     }
    
}

