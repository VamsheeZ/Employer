//
//  ViewController.swift
//  Employer
//
//  Created by Apple on 29/04/20.
//  Copyright © 2020 CCTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private lazy var tableView : UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.dataSource = self
        tbl.delegate = self
        tbl.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tbl
        
    }()
    var employees : [Employee] = []
    
    let apiClient = ApiClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(self.tableView)
        
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

        apiClient.getAllEmployees(OnSuccess: { (employees) in
            
            self.employees = employees
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }) { (error) in
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let emp = self.employees[indexPath.row]
        cell.textLabel?.text = emp.employee_name
        
        return cell
        
    }


}

