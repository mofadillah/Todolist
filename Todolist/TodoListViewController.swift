//
//  ViewController.swift
//  Todolist
//
//  Created by Fadillah Hadiyanto on 27/10/18.
//  Copyright © 2018 Fadillah Hadiyanto. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Cari Kang Cecep", "Beli Kopi", "Jadikan IT Holding"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text  = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK - TableView Delegeate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else{
           tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

