//
//  TaskDetailViewController.swift
//  TableView
//
//  Created by Lorena Rodrigues Bruno on 13/09/2018.
//  Copyright © 2018 Lorena Rodrigues Bruno. All rights reserved.
//

import UIKit

protocol TaskDetailViewControllerDelegate {
    func didUpdateTask()
}

class TaskDetailViewController: UIViewController {

    var selectedTask : Task?
    var taskDetailDelegate: TaskDetailViewControllerDelegate?
    var datePicker = UIDatePicker()
    var tapGestureRecognizer = UITapGestureRecognizer()
    var toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 375, height: 32))
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tapGestureRecognizer.cancelsTouchesInView = false
        tapGestureRecognizer.addTarget(self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)

        datePicker.addTarget(self, action: #selector(handleDate(_:)), for: .valueChanged)

        toolbar.barStyle = .default
        toolbar.setItems([UIBarButtonItem(title: "Ok", style: .done, target: self, action: #selector(handleDone(_:)))], animated: true)
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = toolbar
        dateTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateWithSelectedTask()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @objc func handleDone(_ sender: Any?) {
        view.endEditing(true)
        dateTextField.text = Task.stringFromDate(date: datePicker.date)
    }

    @objc func handleDate(_ sender: UIDatePicker) {
        dateTextField.text = Task.stringFromDate(date: datePicker.date)
    }

    private func updateWithSelectedTask() {
        nameTextField.text = selectedTask?.name ?? ""
        dateTextField.text = selectedTask?.dateString() ?? ""
        descriptionTextView.text = selectedTask?.description ?? ""
    }

    private func taskValid() -> Bool {
        guard let name = nameTextField.text, name.count > 0, let date = dateTextField.text, date.count > 0 else {
            return false
        }
        return true
    }

    private func showInvalidTaskError() {
        let alert = UIAlertController(title: "Erro", message: "Informações inválidas da task", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default, handler: { (_ action: UIAlertAction) in })
        alert.addAction(actionOk)
        present(alert, animated: true, completion: nil)
    }

    private func showRemoveTaskConfirmation(completion: @escaping (_ yesOrNo: Bool) -> Void) {

        let alert = UIAlertController(title: "Alerta", message: "Tem certeza que deseja remover a task?", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .destructive, handler: { (_ action: UIAlertAction) in
            completion(true)
        })
        alert.addAction(actionOk)

        let actionCancel = UIAlertAction(title: "Cancelar", style: .default, handler: { (_ action: UIAlertAction) in
            completion(false)
        })
        alert.addAction(actionCancel)

        present(alert, animated: true, completion: nil)
    }

    @IBAction func actionSave(_ sender: Any) {

        if !taskValid() {
            showInvalidTaskError()
            return
        }

        let task: Task = selectedTask ?? Task()

        task.name = nameTextField.text ?? ""
        task.date = Task.dateFromString(dateString: dateTextField.text ?? "")
        task.description = descriptionTextView.text
        TaskManager.shared.saveOrUpdate(task: task)

        taskDetailDelegate?.didUpdateTask()

        navigationController?.popViewController(animated: true)
    }

    @IBAction func actionDelete(_ sender: Any) {

        guard let task = selectedTask else {
            return
        }

        showRemoveTaskConfirmation(completion: { [weak self] (_ yesOrNo: Bool ) in

            _ = TaskManager.shared.remove(task: task)
            self?.taskDetailDelegate?.didUpdateTask()

            self?.navigationController?.popViewController(animated: true)
        })
    }
}

extension TaskDetailViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == dateTextField {
            dateTextField.text = Task.stringFromDate(date: datePicker.date)
        }
    }
}
