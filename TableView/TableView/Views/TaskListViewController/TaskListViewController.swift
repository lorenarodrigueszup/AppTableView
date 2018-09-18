//
//  TaskListViewController.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 13/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var selectedTask : Task?
    let kSegueShowTaskDetail = "SegueShowTaskDetail"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func actionCreate(_ sender: Any) {
        selectedTask = nil
        performSegue(withIdentifier: kSegueShowTaskDetail, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kSegueShowTaskDetail, let destinationVC = segue.destination as? TaskDetailViewController {
            destinationVC.selectedTask = selectedTask
            destinationVC.taskDetailDelegate = self
        }
    }
}

extension TaskListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.shared.tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskListTableViewCell.identifier) else {
            return UITableViewCell()
        }
        return cell
    }
}

extension TaskListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedTask = TaskManager.shared.tasks[indexPath.row]
        performSegue(withIdentifier: kSegueShowTaskDetail, sender: self)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? TaskListTableViewCell else { return }
        let task = TaskManager.shared.tasks[indexPath.row]
        cell.task = task
    }
}

extension TaskListViewController: TaskDetailViewControllerDelegate {
    func didUpdateTask() {
        tableView.reloadData()
    }
}

