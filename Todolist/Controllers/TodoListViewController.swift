//
//  ViewController.swift
//  Todolist
//
//  Created by Fadillah Hadiyanto on 27/10/18.
//  Copyright © 2018 Fadillah Hadiyanto. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Item()
        newItem.task = "First Item"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.task = "First2 Item"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.task = "First3 Item"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
    }
    
    //MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text  = item.task
        
        cell.accessoryType = item.checked ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK - TableView Delegeate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].checked = !itemArray[indexPath.row].checked
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Item
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Todolist Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //Happen when add button clicked
            let newItem = Item()
            newItem.task = textField.text!
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Item Name"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    

}

