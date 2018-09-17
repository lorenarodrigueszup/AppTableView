//
//  DetailsView.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 13/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit

class DetailsView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
    }
    
    @IBOutlet weak var tarefaLabel: UILabel!
    
    @IBOutlet weak var descricaoLabel: UILabel!
    
    class Task : ViewController.Task {
//        var id : Int = 0
//        var nomeTarefa : String = ""
//        var data : Date = Date()
//        var descricao : String = ""
        
//        init(nomeTarefa: String, data: String, descricao: String) {
//            self.id += 1
//            self.nomeTarefa = nomeTarefa
//            self.descricao = descricao
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "dd-MM-yyyy"
//            self.data =  dateFormatter.date(from: data)!
//
//        }
        override init(nomeTarefa: String, data: String, descricao: String) {
            super.init(nomeTarefa: nomeTarefa, data: data, descricao: descricao)
        }
        
    }
    
    
    var nomeTarefa = String()
    var dataTarefa = Date()
    var descricaoTarefa = String()
    var selectedTask : Task?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tarefaLabel.text = selectedTask?.nomeTarefa
        datePicker.date = (selectedTask?.data)!
        descricaoLabel.text = selectedTask?.descricao
//        tarefaLabel.text = nomeTarefa
//        datePicker.date = dataTarefa
//        descricaoLabel.text = descricaoTarefa
        
    }
    
    @IBAction func buttonExcluir(_ sender: Any) {
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "SegueEdita"
//            {
//                if let destinationVC = segue.destination as? ViewController {
//                    let indexPath = destinationVC.tableView.indexPathForSelectedRow
//                    destinationVC.tasks.remove(at: (indexPath?.row)!)
//                    destinationVC.tableView.reloadData()
//                }
//            }
//        }
    }
    
    
    @IBOutlet weak var textFieldTarefa: UITextField!
    
    @IBOutlet weak var textFieldDescricao: UITextField!
    
    @IBAction func buttonSalvar(_ sender: Any) {
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "SegueEdita"
//            {
//                if let destinationVC = segue.destination as? ViewController {
//                    let indexPath = destinationVC.tableView.indexPathForSelectedRow
//                    destinationVC.tasks[(indexPath?.row)!].nomeTarefa = textFieldTarefa.text!
//                    destinationVC.tasks[(indexPath?.row)!].data = datePicker.date
//                    destinationVC.tasks[(indexPath?.row)!].descricao = textFieldDescricao.text!
//                    destinationVC.tableView.reloadData()
//                }
//            }
//        }
    }
    
    
    
    
}
