//
//  ViewController.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 13/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , DetailsViewDelegate{

    @IBOutlet weak var tableView: UITableView!

    var tasks = [Task]()
    var selectedTask : Task?
    let dateFormatter = DateFormatter()
    
    func didUpdate(task: Task) {
        for currentTask in tasks {
            if currentTask.id == task.id {
                let indice : Int = tasks.index(where: {$0.id == selectedTask?.id})!
                tasks[indice] = task
            }
            
        }

        tableView.reloadData()
    }
    
    func shouldDeletTask(task: Task) {
        if let indice  = tasks.index(where: {$0.id == selectedTask?.id}) {
            tasks.remove(at: indice)
        }
        tableView.reloadData()
    }
    
    func adicionaTarefas() {
        tasks.append(Task(nomeTarefa: "Ir ao supermercado", stringData:"21-09-2018", descricao: "Ir ao supermercado Carrefour a noite"))
        tasks.append(Task(nomeTarefa: "Ir ao médico", stringData:"15-09-2018", descricao: "Médico de vista" ))
        tasks.append(Task(nomeTarefa: "Ir à academia", stringData: "05-10-2018", descricao: "Treino de perna"))
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
            dateFormatter.dateFormat = "dd-MM-yyyy"
            cell.dataTask.text = dateFormatter.string(from: tasks[indexPath.row].data)
            tasks[indexPath.row].id = indexPath.row
            
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTask = tasks[indexPath.row]
        performSegue(withIdentifier: "ShowTaskSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTaskSegue"
        {
            if let destinationVC = segue.destination as? DetailsView {
                destinationVC.selectedTask = selectedTask
                destinationVC.delegate = self
            }
        }
        
    }

    @IBAction func buttonCriar(_ sender: Any) {
        let newElement = Task(nomeTarefa: "", stringData: "", descricao: "")
        tasks.append(newElement)
        selectedTask = newElement
        performSegue(withIdentifier: "ShowTaskSegue", sender: self)
     }
    
}

