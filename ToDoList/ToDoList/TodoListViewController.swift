//
//  ViewController.swift
//  ToDoList
//
//  Created by HappyDuck on 2021/12/15.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["빨래하기","아보카도 물주기","보고서 작성하기"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        
    }
    
    //MARK: - Tableview Datasource Methods
    
    //셀(행)이 몇개인지 설정하는 함수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //어떤 데이터가 각 셀에 들어가야 하는지 설정하는 함수
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        //Adding checkmark
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //Flashing grey
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}

