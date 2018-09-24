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
    
    override init() {
        
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nameTask, forKey: "nameTask")
        aCoder.encode(date, forKey: "dateTask")
        aCoder.encode(descriptionTask, forKey: "DescriptionTask")
        aCoder.encode(id, forKey: "idTask")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.nameTask = aDecoder.decodeObject(forKey: "nameTask") as? String ?? String()
        self.date = aDecoder.decodeObject(forKey: "dateTask") as? Date ?? Date()
        self.descriptionTask = aDecoder.decodeObject(forKey: "DescriptionTask") as? String ?? String()
        self.id = aDecoder.decodeObject(forKey: "IdTask") as? Int
    }
    
    var id : Int?
    var nameTask : String = ""
    var date : Date = Date()
    var descriptionTask : String = ""
    
    
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
    
    
}
