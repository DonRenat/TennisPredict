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
        cell.textLabel!.text = (person.value(forKey: "name1") as! String) + " vs " + (person.value(forKey: "name2") as! String)//name of match
        
        return cell
    }

    @IBAction func addMatch(_ sender: Any) {
        performSegue(withIdentifier: "showAddVC", sender: self)
    }
    
    func saveMatch(name1: String, name2: String, rating1: Int, rating2: Int) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = delegate.persistentContainer.viewContext
     
        let entity =  NSEntityDescription.entity(forEntityName: "Match", in: managedObjectContext)
        let match = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
     
        match.setValue(name1, forKey: "name1")
        match.setValue(name2, forKey: "name2")
        match.setValue(rating1, forKey: "rating1")
        match.setValue(rating2, forKey: "rating2")
        
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
        if segue.identifier == "showDetailVC" {
            let detailVC: DetailVC = segue.destination as! DetailVC
            detailVC.selectedMatch = selectedMatch
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //print(matches[indexPath.row].value(forKey: "name1")!)
        selectedMatch = matches[indexPath.row] as! Match
        performSegue(withIdentifier: "showDetailVC", sender: self)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteButton = UITableViewRowAction(style: .default, title: "Удалить") { (action, indexPath) in
            self.tableView.dataSource?.tableView!(self.tableView, commit: .delete, forRowAt: indexPath)
            return
        }
        deleteButton.backgroundColor = UIColor.init(named: "Dark background")
        return [deleteButton]
    }
    
}

