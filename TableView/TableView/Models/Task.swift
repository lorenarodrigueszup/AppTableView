//
//  Task.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 18/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import Foundation

class Task {
    var id: Int?
    var name: String = ""
    var date: Date = Date()
    var description: String = ""
}

extension Task {

    func dateString() -> String {
        return Task.stringFromDate(date: date)
    }

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
}
