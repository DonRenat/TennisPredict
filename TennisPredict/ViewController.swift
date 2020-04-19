//
//  ViewController.swift
//  TennisPredict
//
//  Created by Renat Gasanov on 20.04.2020.
//  Copyright © 2020 Renat Gasanov. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var matches = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Список матчей"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = delegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Match")
        
        do {
            let fetchedResults = try managedObjectContext.fetch(fetchRequest) as? [NSManagedObject]
            if let results = fetchedResults {
              matches = results
            }
        } catch {
            print("Failed")
        }
    }

    func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        let person = matches[indexPath.row]
        cell.textLabel!.text = (person.value(forKey: "name1") as! String) + (person.value(forKey: "name2") as! String)//name of match
        
        return cell
    }

    @IBAction func addMatch(_ sender: Any) {
        let alert = UIAlertController(title: "Новый матч",
             message: "Добавьте новый матч",
             preferredStyle: .alert)
        
         let saveAction = UIAlertAction(title: "Сохранить", style: .default) { (action: UIAlertAction!) -> Void in
            let textFieldName1 = alert.textFields![0]
            let textFieldName2 = alert.textFields![1]
            self.saveMatch(name1: textFieldName1.text!, name2: textFieldName2.text!)
            self.tableView.reloadData()
         }
        
        saveAction.isEnabled = false
        
         let cancelAction = UIAlertAction(title: "Отмена",
                                          style: .default) { (action: UIAlertAction!) -> Void in
         }
        
        alert.addTextField {
           (textField: UITextField!) -> Void in
         }
        alert.addTextField {
          (textField: UITextField!) -> Void in
        }
        
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object:alert.textFields?[0],
                                                     queue: OperationQueue.main) { (notification) -> Void in

                let textFieldName1 = alert.textFields![0]
                let textFieldName2 = alert.textFields![1]
                saveAction.isEnabled = !textFieldName1.text!.isEmpty &&  !textFieldName2.text!.isEmpty
        }
        
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object:alert.textFields?[1],
                                                      queue: OperationQueue.main) { (notification) -> Void in

                let textFieldName1 = alert.textFields![0]
                let textFieldName2 = alert.textFields![1]
                saveAction.isEnabled = !textFieldName1.text!.isEmpty &&  !textFieldName2.text!.isEmpty
        }
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
         
        
        present(alert,
             animated: true,
             completion: nil)
    }
    
    func saveMatch(name1: String, name2: String) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = delegate.persistentContainer.viewContext
     
        let entity =  NSEntityDescription.entity(forEntityName: "Match", in: managedObjectContext)
        let person = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
     
        person.setValue(name1, forKey: "name1")
        person.setValue(name2, forKey: "name2")
     
        //var error: NSError?
        //if !managedObjectContext.save(&error) { print("Could not save \(error), \(error?.userInfo)") }
        
        matches.append(person)
    }
}

