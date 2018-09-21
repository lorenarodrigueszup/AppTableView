//
//  TaskManager.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 19/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import Foundation
import UIKit

class TaskManager {
    
    public static let shared = TaskManager()
    
    var tasks: [Task] = [Task]()
    
    func generateId() -> Int {
        return Int(arc4random())
    }
    
    func generateValidId() -> Int {
        var id = generateId()
        var taskIndex : Int? = nil
        
        repeat {
            taskIndex = tasks.index(where: {$0.id == id})
            id = generateId()
        } while taskIndex != nil
        
        return id
    }
    
    func saveOrUpdate(task: Task) {
        if task.id == nil {
            task.id = generateValidId()
        }
        if let index = tasks.index(where: {$0.id == task.id}) {
            tasks[index] = task
        } else {
            tasks.append(task)
        }
        
    }
    
    func deleteTask(task: Task) -> Bool {
        if let index  = tasks.index(where: {$0.id == task.id}) {
            tasks.remove(at: index)
            return true
        }
        return false
    }
    
    func getTask(with id: Int) -> Task? {
        if let index  = tasks.index(where: {$0.id == id}) {
            return tasks[index]
        }
        return nil
    }
    
    
}

