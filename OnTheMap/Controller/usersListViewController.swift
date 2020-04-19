//
//  usersListViewController.swift
//  OnTheMap
//
//  Created by omar Al-joundi on 4/14/20.
//  Copyright © 2020 omar Al-joundi. All rights reserved.
//

import Foundation
import UIKit

class usersListViewController : UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    
    override func viewDidLoad() {
        OnTheMap.getMultipleStudents { (users, error) in
             usersModel.results = users
            DispatchQueue.main.async {
            self.TableView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         
         TableView.reloadData()
     }
     
    
    
}
extension usersListViewController : UITableViewDataSource , UITableViewDelegate {
       
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return usersModel.results.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = TableView.dequeueReusableCell(withIdentifier: "usersTableViewcell")
            let user = usersModel.results[indexPath.row]
            cell?.textLabel?.text = (user.firstName) + " " + (user.lastName)
            return cell!
                }
            
            
           
        
        
    
        
    }


