//
//  CaseThreeTableViewController.swift
//  SESAC-TableView
//
//  Created by Seryun Chun on 2024/01/05.
//

import UIKit

class CaseThreeTableViewController: UITableViewController {
    
    var todoList: [String] = [
        "제로콜라 구매",
        "다진 마늘 구매",
        "맥북 거치대 알아보기",
        "무소음 기계식 키보드 알아보기",
        "운동 등록하기"
    ]
    
    @IBOutlet var textfieldView: UIView!
    @IBOutlet var todoTextfield: UITextField!
    @IBOutlet var cellView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadius(view: textfieldView)
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        // add todoList
        let todo = todoTextfield.text!
        todoList.append(todo)
        tableView.reloadData()
        
        todoTextfield.text = ""
        
        // Keyboard Dismiss
        view.endEditing(true)
    }
    
    @IBAction func keyboardDismiss(_ sender: Any) {
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CaseThreeTableViewCell", for: indexPath) as! CaseThreeTableViewCell
        
        setCornerRadius(view: cell.cellView)
        
        cell.cellLabel?.text = todoList[indexPath.row]
        cell.cellLabel?.font = .systemFont(ofSize: 12)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func setCornerRadius(view: UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
    }
}
