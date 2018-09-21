//
//  DetailsView.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 13/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit

protocol DetailsViewDelegate {
    func didUpdate(task : Task)
    
    func shouldDeletTask(task: Task)
}

class DetailsView: UIViewController {

    var selectedTask : Task?
    var delegate : DetailsViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if selectedTask?.nomeTarefa == "" {
            buttonExcluir.isHidden = true
        }
        
        datePicker.date = (selectedTask?.data) ?? Date()
        tarefaLabel.text = selectedTask?.nomeTarefa
        descricaoLabel.text = selectedTask?.descricao
        
        
    }
    

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
    }
    
    @IBOutlet weak var tarefaLabel: UILabel!
    
    @IBOutlet weak var descricaoLabel: UILabel!
    

    @IBAction func buttonSalvar(_ sender: Any) {
        
        if textFieldDescricao.text != "" {
            selectedTask?.descricao = textFieldDescricao.text!
        }
        
        if textFieldTarefa.text != "" {
            selectedTask?.nomeTarefa = textFieldTarefa.text!
        }
        
        selectedTask?.data = datePicker.date
        
        if let task = selectedTask {
            self.delegate?.didUpdate(task: task)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonExcluir(_ sender: Any) {
        if let task = selectedTask {
            delegate?.shouldDeletTask(task: task)
        }
        
        self.navigationController?.popViewController(animated: true)
        if let task = selectedTask {
            self.delegate?.didUpdate(task: task)
        }
    }
    
    @IBOutlet weak var buttonExcluir: UIButton!
    
    
    @IBOutlet weak var textFieldTarefa: UITextField!
    
    
    @IBOutlet weak var textFieldDescricao: UITextField!
    
    

    
    
}
