//
//  ViewController.swift
//  TennisPredict
//
//  Created by Renat Gasanov on 20.04.2020.
//  Copyright © 2020 Renat Gasanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var matches = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "The List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
           cell.textLabel!.text = matches[indexPath.row]
        
         return cell
    }

    @IBAction func addMatch(_ sender: Any) {
        let alert = UIAlertController(title: "New name",
             message: "Add a new name",
             preferredStyle: .alert)
        
         let saveAction = UIAlertAction(title: "Save",
                                        style: .default) { (action: UIAlertAction!) -> Void in
        
           let textField = alert.textFields![0] 
           self.matches.append(textField.text!)
           self.tableView.reloadData()
         }
        
         let cancelAction = UIAlertAction(title: "Cancel",
                                          style: .default) { (action: UIAlertAction!) -> Void in
         }
        
        alert.addTextField {
           (textField: UITextField!) -> Void in
         }
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
         
        
        present(alert,
             animated: true,
             completion: nil)
    }
}

