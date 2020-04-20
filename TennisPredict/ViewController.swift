//
//  ViewController.swift
//  TennisPredict
//
//  Created by Renat Gasanov on 20.04.2020.
//  Copyright © 2020 Renat Gasanov. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var matches = [NSManagedObject]()
    var selectedMatch: Match?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Список матчей"
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
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell")!
        
        let person = matches[indexPath.row]
        cell.textLabel!.text = (person.value(forKey: "name1") as! String) + (person.value(forKey: "name2") as! String)//name of match
        
        return cell
    }

    @IBAction func addMatch(_ sender: Any) {
        /*let alert = UIAlertController(title: "Новый матч",
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
             completion: nil)*/
        performSegue(withIdentifier: "showAddVC", sender: self)
    }
    
    func saveMatch(name1: String, name2: String) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = delegate.persistentContainer.viewContext
     
        let entity =  NSEntityDescription.entity(forEntityName: "Match", in: managedObjectContext)
        let match = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
     
        match.setValue(name1, forKey: "name1")
        match.setValue(name2, forKey: "name2")
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
     
        //var error: NSError?
        //if !managedObjectContext.save(&error) { print("Could not save \(error), \(error?.userInfo)") }
        
        matches.append(match)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if let destination = segue.destination as? DetailVC{
            //destination.selectedMatch = matches[(tableView.indexPathForSelectedRow?.row)!] as? Match
        //}
        if segue.identifier == "showDetailVC" {
            let detailVC: DetailVC = segue.destination as! DetailVC
            detailVC.selectedMatch = selectedMatch
            //detailVC.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(matches[indexPath.row].value(forKey: "name1")!)
        selectedMatch = matches[indexPath.row] as! Match
        performSegue(withIdentifier: "showDetailVC", sender: self)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    }
    
}

