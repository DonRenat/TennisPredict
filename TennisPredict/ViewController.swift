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
    
    func saveMatch(name1: String, name2: String, rating1: Int, rating2: Int, date: Date, winner: String, ace1: Int, ace2: Int, df1: Int, df2: Int, wpp1: Int, wpp2: Int, wwp1: Int, wwp2: Int, wpps1: Int, wpps2: Int, wwps1: Int, wwps2: Int, break1: Int, break2: Int, active1: Int, active2: Int, fault1: Int, fault2: Int, gamesp1: Int, gamesp2: Int, gamep1: Int, gamep2: Int) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = delegate.persistentContainer.viewContext
     
        let entity =  NSEntityDescription.entity(forEntityName: "Match", in: managedObjectContext)
        let match = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
     
        match.setValue(name1, forKey: "name1")
        match.setValue(name2, forKey: "name2")
        match.setValue(rating1, forKey: "rating1")
        match.setValue(rating2, forKey: "rating2")
        match.setValue(date, forKey: "date")
        //new
        match.setValue(winner, forKey: "winner")
        
        match.setValue(ace1, forKey: "ace1")
        match.setValue(ace2, forKey: "ace2")
        
        match.setValue(df1, forKey: "df1")
        match.setValue(df2, forKey: "df2")
        
        match.setValue(wpp1, forKey: "wpp1")
        match.setValue(wpp2, forKey: "wpp2")
        
        match.setValue(wwp1, forKey: "wwp1")
        match.setValue(wwp2, forKey: "wwp2")
        
        match.setValue(wpps1, forKey: "wpps1")
        match.setValue(wpps2, forKey: "wpps2")
        
        match.setValue(wwps1, forKey: "wwps1")
        match.setValue(wwps2, forKey: "wwps2")
        
        match.setValue(break1, forKey: "break1")
        match.setValue(break2, forKey: "break2")
        
        match.setValue(active1, forKey: "active1")
        match.setValue(active2, forKey: "active2")
        
        match.setValue(fault1, forKey: "fault1")
        match.setValue(fault2, forKey: "fault2")
        
        match.setValue(gamesp1, forKey: "gamesp1")
        match.setValue(gamesp2, forKey: "gamesp2")
        
        match.setValue(gamep1, forKey: "gamep1")
        match.setValue(gamep2, forKey: "gamep2")
        
        
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

