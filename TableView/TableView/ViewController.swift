//
//  ViewController.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 13/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    
    var tasks = [Task]()
    var selectedTask : Task?
    let dateFormatter = DateFormatter()
    
    
    func adicionaTarefas() {
        tasks.append(Task(nomeTarefa: "Ir ao supermercado", stringData:"21-09-2018", descricao: "Ir ao supermercado Carrefour a noite"))
        tasks.append(Task(nomeTarefa: "Ir ao médico", stringData:"15-09-2018", descricao: "Médico de vista" ))
        tasks.append(Task(nomeTarefa: "Ir à academia", stringData: "05-10-2018", descricao: "Treino de perna"))
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func awakeFromNib() {
        adicionaTarefas()
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
            dateFormatter.dateFormat = "dd-MM-yyyy"
            cell.dataTask.text = dateFormatter.string(from: tasks[indexPath.row].data)
            tasks[indexPath.row].id = indexPath.row
            
        }

        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTaskSegue"
        {
            if let destinationVC = segue.destination as? DetailsView {
               let indexPath = tableView.indexPathForSelectedRow
                  selectedTask = tasks[(indexPath?.row)!]
                  destinationVC.selectedTask = selectedTask
                  destinationVC.tasks = tasks
            }
        }
        
        if segue.identifier == "SegueCriar"
        {
            if let destinationVC = segue.destination as? DetailsView {
                dateFormatter.dateFormat = "dd-MM-yyyy"
                selectedTask = Task(nomeTarefa: "", stringData: "", descricao: "")
                selectedTask?.id = tasks.count
                destinationVC.selectedTask = self.selectedTask
                destinationVC.tasks = self.tasks
                
           }

        }

        
    }

    
    @IBAction func buttonCriar(_ sender: Any) {
        
     }
    
        
    

    
}

