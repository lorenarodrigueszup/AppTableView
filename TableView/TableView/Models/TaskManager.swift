//
//  TaskManager.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 19/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class TaskManager {
    
    
    // MARK: - Variáveis
    
    public static let shared = TaskManager()
    private(set) var tasks: [Task] = [Task]()
    let defaults = UserDefaults.standard
    
    // MARK: - Métodos
    
    init() {
        load()
    }
    
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
        save()
        Notification.schedulePushNotification(task)
    }
    
    func deleteTask(task: Task) -> Bool {
        if let index  = tasks.index(where: {$0.id == task.id}) {
            tasks.remove(at: index)
            save()
            Notification.deleteNotification(notificationId: task.notificationId)
            return true
        }
        save()
        return false
    }
    
    func getTask(with id: Int) -> Task? {
        if let index  = tasks.index(where: {$0.id == id}) {
            return tasks[index]
        }
        return nil
    }
    
    
    func scheduleTasks(){
        for task in tasks {
            Notification.schedulePushNotification(task)
        }
    }
    
    func save() {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: tasks)
        defaults.set(encodedData, forKey: "tasks")
        defaults.synchronize()
    }
    
    func load() {
        let decodedArray = NSKeyedUnarchiver.unarchiveObject(with: UserDefaults.standard.object(forKey: "tasks") as? Data ?? Data()) as? [Task] ?? [Task]()
        tasks = decodedArray

    }

    
    
}

