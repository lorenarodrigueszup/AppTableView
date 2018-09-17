//
//  ViewController.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 13/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!

    @IBAction func TextTarefa(_ sender: Any) {
    }
    
    @IBAction func TextDescricao(_ sender: Any) {
    }
    
    class Task {
        var id : Int = 0
        var nomeTarefa : String = ""
        var data : Date = Date()
        var descricao : String = ""
        
        init(nomeTarefa: String, data: String, descricao: String) {
            self.id += 1
            self.nomeTarefa = nomeTarefa
            self.descricao = descricao
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            self.data =  dateFormatter.date(from: data)!
            
            
        }
    }
    
    var tasks = [Task]()
    var selectedTask : Task?
    func adicionaTarefas() {
        tasks.append(Task(nomeTarefa: "Ir ao supermercado", data:"21-09-2018", descricao: "Ir ao supermercado Carrefour a noite"))
        tasks.append(Task(nomeTarefa: "Ir ao médico", data:"15-09-2018", descricao: "Médico de vista" ))
        tasks.append(Task(nomeTarefa: "Ir à academia", data: "05-10-2018", descricao: "Treino de perna"))
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        adicionaTarefas()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId")!
        if let cell = cell as? TaskTableViewCell {
            cell.nomeTask.text = tasks[indexPath.row].nomeTarefa
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            cell.dataTask.text = dateFormatter.string(from: tasks[indexPath.row].data)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.selectedTask = tasks[indexPath.row]
        self.performSegue(withIdentifier: "ShowTaskSegue", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTaskSegue"
        {
            if let destinationVC = segue.destination as? DetailsView {
//               let indexPath = self.tableView.indexPathForSelectedRow
//                destinationVC.nomeTarefa = self.tasks[(indexPath?.row)!].nomeTarefa
//                destinationVC.dataTarefa = self.tasks[(indexPath?.row)!].data
//                destinationVC.descricaoTarefa = self.tasks[(indexPath?.row)!].descricao
                destinationVC.selectedTask = self.selectedTask as? DetailsView.Task
            }
        }
        
//        if segue.identifier == "SegueCriar"
//        {
//            if let destinationVC = segue.destination as? DetailsView {
//                let indexPath = self.tableView.indexPathForSelectedRow
//                destinationVC.nomeTarefa = self.tasks[(indexPath?.row)!].nomeTarefa
//                destinationVC.dataTarefa = self.tasks[(indexPath?.row)!].data
//                destinationVC.descricaoTarefa = self.tasks[(indexPath?.row)!].descricao
//
//
//           }
//
//        }

        
        
    }
    
  
    
    @IBAction func buttonCriar(_ sender: Any) {
        self.selectedTask = nil
        performSegue(withIdentifier: "SegueCriacao", sender: nil)
       }
        
        
    

    
}

