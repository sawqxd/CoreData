//
//  ViewController.swift
//  Core Data
//
//  Created by Sarah Wooldridge on 11/1/18.
//  Copyright © 2018 Sarah Wooldridge. All rights reserved.
//

import UIKit
import CoreData

class ExpenseViewController: UIViewController {

    
    @IBOutlet weak var expenseTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    
    var expenses = [Expense]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        
        do {
        expenses = try managedContext.fetch(fetchRequest)
            
            expenseTableView.reloadData()
        } catch {
            print("Fetch could not be preformed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    @IBAction func addNewExpense(_ sender: Any){
        performSegue(withIdentifier: "showExpense", sender: self)
    }
}

extension ExpenseViewController: UITableViewDataSource {
    func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expenseTableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
        
        let expense = expenses[indexPath.row]
        
        cell.textLabel?.text = expense.name
        
        if let date = expense.date {
            cell.detailTextLabel?.text = dateFormatter.string(from: date)
        }
        return cell
    }
}

extension ExpenseViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "showExpense", sender: self)
    }
    
}
