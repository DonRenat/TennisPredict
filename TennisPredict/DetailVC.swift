//
//  DetailVC.swift
//  TennisPredict
//
//  Created by Renat Gasanov on 20.04.2020.
//  Copyright © 2020 Renat Gasanov. All rights reserved.
//

import UIKit
import CoreData
import SkyFloatingLabelTextField

class DetailVC: UIViewController {
    
    var selectedMatch: Match?
    
    @IBOutlet weak var textFieldName1: SkyFloatingLabelTextField!
    @IBOutlet weak var textFieldName2: SkyFloatingLabelTextField!
    @IBOutlet weak var tfRating1: SkyFloatingLabelTextField!
    @IBOutlet weak var tfRating2: SkyFloatingLabelTextField!
    @IBOutlet weak var tfDate: SkyFloatingLabelTextField!
    @IBOutlet weak var winnerSC: UISegmentedControl!
    @IBOutlet weak var tfAce1: SkyFloatingLabelTextField!
    @IBOutlet weak var tfAce2: SkyFloatingLabelTextField!
    @IBOutlet weak var tfDF1: SkyFloatingLabelTextField!
    @IBOutlet weak var tfDF2: SkyFloatingLabelTextField!
    @IBOutlet weak var tfWPP1: SkyFloatingLabelTextField!
    @IBOutlet weak var tfWPP2: SkyFloatingLabelTextField!
    @IBOutlet weak var tfWWP1: SkyFloatingLabelTextField!
    @IBOutlet weak var tfWWP2: SkyFloatingLabelTextField!
    @IBOutlet weak var tfWPPS1: SkyFloatingLabelTextField!
    @IBOutlet weak var tfWPPS2: SkyFloatingLabelTextField!
    @IBOutlet weak var tfWWPS1: SkyFloatingLabelTextField!
    @IBOutlet weak var tfWWPS2: SkyFloatingLabelTextField!
    @IBOutlet weak var tfBreak1: SkyFloatingLabelTextField!
    @IBOutlet weak var tfBreak2: SkyFloatingLabelTextField!
    @IBOutlet weak var tfActive1: SkyFloatingLabelTextField!
    @IBOutlet weak var tfActive2: SkyFloatingLabelTextField!
    @IBOutlet weak var tfFault1: SkyFloatingLabelTextField!
    @IBOutlet weak var tfFault2: SkyFloatingLabelTextField!
    @IBOutlet weak var tfGamesp1: SkyFloatingLabelTextField!
    @IBOutlet weak var tfGamesp2: SkyFloatingLabelTextField!
    @IBOutlet weak var tfGamep1: SkyFloatingLabelTextField!
    @IBOutlet weak var tfGamep2: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: selectedMatch!.value(forKey: "date")! as! Date)
        
        textFieldName1.text = selectedMatch!.value(forKey: "name1") as? String
        textFieldName2.text = selectedMatch!.value(forKey: "name2") as? String
        tfRating1.text = selectedMatch!.value(forKey: "rating1") as? String
        tfRating2.text = selectedMatch!.value(forKey: "rating2") as? String
        tfDate.text = dateString
        tfAce1.text = selectedMatch!.value(forKey: "ace1") as? String
        tfAce2.text = selectedMatch!.value(forKey: "ace2") as? String
        tfDF1.text = selectedMatch!.value(forKey: "df1") as? String
        tfDF2.text = selectedMatch!.value(forKey: "df2") as? String
        tfWPP1.text = selectedMatch!.value(forKey: "wpp1") as? String
        tfWPP2.text = selectedMatch!.value(forKey: "wpp2") as? String
        tfWWP1.text = selectedMatch!.value(forKey: "wwp1") as? String
        tfWWP2.text = selectedMatch!.value(forKey: "wwp1") as? String
        tfWPPS1.text = selectedMatch!.value(forKey: "wpps1") as? String
        tfWPPS2.text = selectedMatch!.value(forKey: "wpps2") as? String
        tfWWPS1.text = selectedMatch!.value(forKey: "wwps1") as? String
        tfWWPS2.text = selectedMatch!.value(forKey: "wwps2") as? String
        tfBreak1.text = selectedMatch!.value(forKey: "break1") as? String
        tfBreak2.text = selectedMatch!.value(forKey: "break2") as? String
        tfActive1.text = selectedMatch!.value(forKey: "active1") as? String
        tfActive2.text = selectedMatch!.value(forKey: "active2") as? String
        tfFault1.text = selectedMatch!.value(forKey: "fault1") as? String
        tfFault2.text = selectedMatch!.value(forKey: "fault2") as? String
        tfGamesp1.text = selectedMatch!.value(forKey: "gamesp1") as? String
        tfGamesp2.text = selectedMatch!.value(forKey: "gamesp2") as? String
        tfGamep1.text = selectedMatch!.value(forKey: "gamep1") as? String
        tfGamep2.text = selectedMatch!.value(forKey: "gamep2") as? String
        
        if selectedMatch!.value(forKey: "winner") as! String == selectedMatch!.value(forKey: "name1") as! String{
            winnerSC.selectedSegmentIndex = 0
        } else {
            winnerSC.selectedSegmentIndex = 1
        }
        
        
        //testLabel.text = (selectedMatch!.value(forKey: "name1") as! String) + String(describing: selectedMatch!.value(forKey: "rating1")!) + (selectedMatch!.value(forKey: "name2") as! String) + String(describing: selectedMatch!.value(forKey: "rating2")!) + dateString + (selectedMatch!.value(forKey: "winner") as! String) + "--" + String(describing: selectedMatch!.value(forKey: "ace1")!) + "--" + String(describing: selectedMatch!.value(forKey: "ace2")!) + "--" + String(describing: selectedMatch!.value(forKey: "df1")!) + "--" + String(describing: selectedMatch!.value(forKey: "df2")!) + "--" + String(describing: selectedMatch!.value(forKey: "fault1")!) + "--" + String(describing: selectedMatch!.value(forKey: "fault2")!)
        
        
    }

}
