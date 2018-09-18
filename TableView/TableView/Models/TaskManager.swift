//
//  TaskManager.swift
//  TableView
//
//  Created by Marcelo Mendes on 18/09/18.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit

class TaskManager {

    public static let shared = TaskManager()

    private(set) var tasks: [Task] = [Task]()

    private init() {
        //
    }

    func saveOrUpdate(task: Task) {
        if task.id == nil {
            task.id = generateValidId()
        }
        if let indexOfTask = tasks.index(where: { $0.id == task.id }) {
            tasks[indexOfTask] = task
        } else {
            tasks.append(task)
        }
    }

    func remove(task: Task) -> Bool {
        if let indexOfTask = tasks.index(where: { $0.id == task.id }) {
            tasks.remove(at: indexOfTask)
            return true
        }
        return false
    }

    func removeAll() {
        tasks = [Task]()
    }

    func getTask(with id: Int) -> Task? {
        if let indexOfTask = tasks.index(where: { $0.id == id }) {
            return tasks[indexOfTask]
        }
        return nil
    }

    private func generateId() -> Int {
        return Int(arc4random())
    }
    
    private func generateValidId() -> Int {
        var id = generateId()
        var indexOfTask: Int? = nil
        repeat {
            indexOfTask = tasks.index(where: { $0.id == id })
            id = generateId()
        } while indexOfTask != nil
        return id
    }

    static func mockTasks() {

        let t1 = Task()
        t1.name = "t1"
        t1.date = Date()
        t1.description = "t1 description"

        TaskManager.shared.saveOrUpdate(task: t1)
    }

}
