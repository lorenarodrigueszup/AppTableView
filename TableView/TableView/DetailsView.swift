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
        tarefaLabel.text = self.selectedTask?.nomeTarefa
        datePicker.date = (self.selectedTask?.data)!
        descricaoLabel.text = self.selectedTask?.descricao
        
    }
    
    @IBAction func buttonExcluir(_ sender: Any) {

    }
    
    @IBOutlet weak var textFieldTarefa: UITextField!
    
    @IBOutlet weak var textFieldDescricao: UITextField!
    
    @IBAction func buttonSalvar(_ sender: Any) {
        self.selectedTask?.descricao = textFieldDescricao.text!
        self.selectedTask?.nomeTarefa = textFieldTarefa.text!
        self.selectedTask?.data = datePicker.date
        
    }
    

    
    
    
    
}
