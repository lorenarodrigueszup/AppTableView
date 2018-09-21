//
//  DetailsView.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 13/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit

protocol DetailsViewDelegate {
    func didUpdate(task:Task)
    
    func shouldDeleteTask(task: Task)
}

class DetailsView: UIViewController {

    var task : Task?
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
        if task?.nameTask == "" {
            buttonDelete.isHidden = true
        }
        
        datePicker.date = (task?.date) ?? Date()
        taskLabel.text = task?.nameTask ?? ""
        descriptionLabel.text = task?.description ?? ""
        
        
    }
    

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
    }
    
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    

    @IBAction func buttonSave(_ sender: Any) {
        
        if textFieldDescription.text != "" {
            task?.description = textFieldDescription.text!
        }
        
        if textFieldTask.text != "" {
            task?.nameTask = textFieldTask.text!
        }
        
        task?.date = datePicker.date
        
        if let updatedTask = task {
            self.delegate?.didUpdate(task: updatedTask)
        }
        
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func buttonDelete(_ sender: Any) {
        if let deletedTask = task {
            delegate?.shouldDeleteTask(task: deletedTask)
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
  
    @IBOutlet weak var buttonDelete: UIButton!
    
    
    @IBOutlet weak var textFieldTask: UITextField!
    
    
    @IBOutlet weak var textFieldDescription: UITextField!
    
    

    
    
}
