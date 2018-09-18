//
//  Task.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 18/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import Foundation

class Task {
    var id : Int = 0
    var nomeTarefa : String = ""
    var data : Date = Date()
    var descricao : String = ""
    var stringData : String = ""
    
    init(nomeTarefa: String, stringData: String, descricao: String) {
        //self.id += 1
        self.nomeTarefa = nomeTarefa
        self.descricao = descricao
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        self.data =  dateFormatter.date(from: stringData)!
        689
        
    }
}


