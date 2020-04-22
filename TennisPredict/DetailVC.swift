//
//  DetailVC.swift
//  TennisPredict
//
//  Created by Renat Gasanov on 20.04.2020.
//  Copyright © 2020 Renat Gasanov. All rights reserved.
//

import UIKit
import CoreData

class DetailVC: UIViewController {
    
    var selectedMatch: Match?
    
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testLabel.text = (selectedMatch!.value(forKey: "name1") as! String) + String(describing: selectedMatch!.value(forKey: "rating1")!) + (selectedMatch!.value(forKey: "name2") as! String) + String(describing: selectedMatch!.value(forKey: "rating2")!)
    }

}
