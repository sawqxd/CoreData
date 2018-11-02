//
//  SingleExpense.swift
//  Core Data
//
//  Created by Sarah Wooldridge on 11/1/18.
//  Copyright © 2018 Sarah Wooldridge. All rights reserved.
//

import UIKit

class SingleExpenseViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        amountTextField.delegate = self
    }
    
    override func didRecieveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    nameTextField.resignFirstResponder()
    amountTextField.resignFirstResponder()
    }
    
    @IBAction func saveExpense(_ sender: Any){
        
        let name = nameTextField.text
        let amountText = amountTextField.text ?? ""
        let amount = Double(amountText) ?? 0.0
        let date = datePicker.date
        
        if let expense = Expense(name: name, amount: amount, date: date){
            do {
                let managedContext = expense.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
                
            } catch {
                print("Context could not be saved")
            }
    }
    
    extension SingleExpenseViewController: UITextFieldDelegate {
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
}
}
