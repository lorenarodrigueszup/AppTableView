//
//  Task.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 18/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import Foundation
import Darwin

class Task : NSObject, NSCoding{
    
    
    // MARK: - NSCoder User Defaults
    override init() {
        
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nameTask, forKey: "taskName")
        aCoder.encode(date, forKey: "taskDate")
        aCoder.encode(descriptionTask, forKey: "taskDescription")
        aCoder.encode(id, forKey: "taskId")
        aCoder.encode(hour, forKey: "taskHour")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.nameTask = aDecoder.decodeObject(forKey: "taskName") as? String ?? String()
        self.date = aDecoder.decodeObject(forKey: "taskDate") as? Date ?? Date()
        self.descriptionTask = aDecoder.decodeObject(forKey: "taskDescription") as? String ?? String()
        self.id = aDecoder.decodeObject(forKey: "taskId") as? Int
        self.hour = aDecoder.decodeObject(forKey: "taskHour") as? String ?? String()
    }
    
    
    // MARK: - Variáveis
    
    var id : Int?
    var nameTask : String = ""
    var date : Date = Date()
    var hour : String = String()
    var descriptionTask : String = ""
    
    var notificationId : String = ""
    

    
    // MARK: - Métodos
    
    static func stringFromDate(date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        return df.string(from: date)
    }
    
    static func dateFromString(dateString: String) -> Date {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        return df.date(from: dateString) ?? Date()
    }
    
    func dateString() -> String {
        return Task.stringFromDate(date: date)
    }
    
    func timeFromString(timeString: String) -> Date {
        let df = DateFormatter()
        df.dateFormat = "HH:mm"
        return df.date(from: timeString) ?? Date()
    }
    

    
    
}
