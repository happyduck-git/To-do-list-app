//
//  ViewController.swift
//  ToDoList
//
//  Created by HappyDuck on 2021/12/15.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "빨래하기"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "아보카도 물주기"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "책 집필 원고 작성하기"
        itemArray.append(newItem3)
        
    }
    
    //MARK: - Tableview Datasource Methods
    
    //셀(행)이 몇개인지 설정하는 함수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //어떤 데이터가 각 셀에 들어가야 하는지 설정하는 함수
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        //Adding checkmark
        if item.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        //Reversing boolean results
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        //Reflect changes in checkmark
        tableView.reloadData()
        
        //Flashing grey
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //MARK: - Add New Items
    @IBAction func addItemsBtnPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "새로운 할 일", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "추가하기", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "항목을 입력하세요"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

