//
//  Task.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 18/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import Foundation
import Darwin

class Task {
    var id : Int = 0
    var nomeTarefa : String = ""
    var data : Date = Date()
    var descricao : String = ""
    var stringData : String = ""
    
    
    init(nomeTarefa: String, stringData: String, descricao: String) {
        self.id = Int(arc4random_uniform(1000))
        self.nomeTarefa = nomeTarefa
        self.descricao = descricao
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        self.data =  dateFormatter.date(from: stringData) ?? Date()

    }
    

    
    
}




