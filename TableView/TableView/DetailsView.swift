//
//  DetailsView.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 13/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit

class DetailsView: UIViewController {

    var selectedTask : Task?
    var tasks = [Task]()
    
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
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        datePicker.date = (selectedTask?.data)!
        tarefaLabel.text = selectedTask?.nomeTarefa
        descricaoLabel.text = selectedTask?.descricao
        
    }
    
    @IBAction func buttonExcluir(_ sender: Any) {
        let indice : Int = tasks.index(where: {$0.id == selectedTask?.id})!
        tasks.remove(at: indice)
    }
    
    @IBOutlet weak var buttonExcluir: UIButton!
    
    
    @IBOutlet weak var textFieldTarefa: UITextField!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
        
    }
    
    @IBOutlet weak var textFieldDescricao: UITextField!
    
    @IBAction func buttonSalvar(_ sender: Any) {
        if textFieldDescricao.text != "" {
            selectedTask?.descricao = textFieldDescricao.text!
        }

        if textFieldTarefa.text != "" {
            selectedTask?.nomeTarefa = textFieldTarefa.text!
        }
        
        selectedTask?.data = datePicker.date

        
        for task in tasks {
            if task.id == selectedTask?.id {
                let indice : Int = tasks.index(where: {$0.id == selectedTask?.id})!
                tasks[indice] = selectedTask!
            } else if (selectedTask?.id)! >= tasks.count {
                if let task = selectedTask {
                    tasks.append(task)
                }
                
            }
            
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveSegue" || segue.identifier == "DeletSegue" {
            if let destinationVC = segue.destination as? ViewController {
                destinationVC.tasks = self.tasks  
            }
        }
    }

    
    
    
    
}
