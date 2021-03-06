//
//  ViewController.swift
//  TennisPredict
//
//  Created by Renat Gasanov on 20.04.2020.
//  Copyright © 2020 Renat Gasanov. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var matches = [NSManagedObject]()
    var selectedMatch: Match?
    @IBOutlet weak var ongoingButton: UIButton!
    @IBOutlet weak var liveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        setupLongPressGesture()
        
        ongoingButton.layer.cornerRadius = 15
        ongoingButton.layer.cornerCurve = .continuous
        
        liveButton.layer.cornerRadius = 15
        liveButton.layer.cornerCurve = .continuous
    }
    
    func setupLongPressGesture() {
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress))
        longPressGesture.minimumPressDuration = 1.0 // 1 second press
        //longPressGesture.delegate = self
        self.tableView.addGestureRecognizer(longPressGesture)
    }

    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer){
        if gestureRecognizer.state == .began {
            let touchPoint = gestureRecognizer.location(in: self.tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                print("long press done")
                selectedMatch = matches[indexPath.row] as! Match
                performSegue(withIdentifier: "showEditVC", sender: self)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        /*let delegate = UIApplication.shared.delegate as! AppDelegate
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
        
        tableView.reloadData()*/
        fetchData()
    }
    
    func fetchData(){
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
        //let total = matches.count
        //let person = matches[total - indexPath.row - 1]
        //end test
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: person.value(forKey: "date")! as! Date)
        cell.textLabel!.text = dateString + " " + (person.value(forKey: "name1") as! String) + " vs " + (person.value(forKey: "name2") as! String)//name of match
        cell.detailTextLabel!.text = "Победитель " + (person.value(forKey: "winner") as! String)
        
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
        if segue.identifier == "showEditVC" {
            let editVC: EditVC = segue.destination as! EditVC
            editVC.selectedMatch = selectedMatch
            //editVC.id = selectedMatch?.objectID
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedMatch = matches[indexPath.row] as! Match
        //let total = matches.count
        //let selectedMatch = matches[total - indexPath.row - 1] as! Match
        //end test
        performSegue(withIdentifier: "showDetailVC", sender: self)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let managedObjectContext = delegate.persistentContainer.viewContext
            
            managedObjectContext.delete(self.matches[indexPath.row])
            
            do {
                try managedObjectContext.save()
                self.matches.removeAll()
                self.fetchData()
            } catch {
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteButton = UITableViewRowAction(style: .default, title: "Удалить") { (action, indexPath) in
            self.tableView.dataSource?.tableView!(self.tableView, commit: .delete, forRowAt: indexPath)
            return
        }
        deleteButton.backgroundColor = UIColor.init(named: "Dark background")
        return [deleteButton]
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
            var predicate: NSPredicate = NSPredicate()
            predicate = NSPredicate(format: "name1 contains[c] '\(searchText)'")
            
            var predicate2: NSPredicate = NSPredicate()
            predicate2 = NSPredicate(format: "name2 contains[c] '\(searchText)'")
            
            let predicateFinal:NSPredicate  = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate,predicate2] )
            
            let delegate = UIApplication.shared.delegate as! AppDelegate
            let managedObjectContext = delegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Match")
            fetchRequest.predicate = predicateFinal
            
            do{
                matches = try managedObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            } catch{
                print("Search error")
            }
        } else {
            fetchData()
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        //searchActive = false
        self.searchBar.endEditing(true)
    }
    
    @IBAction func ongoingClick(_ sender: Any) {
        performSegue(withIdentifier: "showONGOING", sender: self)
    }
    
    
    @IBAction func liveClick(_ sender: Any) {
        performSegue(withIdentifier: "showLIVE", sender: self)
    }
    
}

