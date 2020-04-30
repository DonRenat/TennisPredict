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
        
        textFieldName1.text = (selectedMatch!.value(forKey: "name1") as! String)
        textFieldName2.text = (selectedMatch!.value(forKey: "name2") as! String)
        tfRating1.text = String(describing: selectedMatch!.value(forKey: "rating1")!)
        tfRating2.text = String(describing:selectedMatch!.value(forKey: "rating2")!)
        tfDate.text = dateString
        tfAce1.text = String(describing: selectedMatch!.value(forKey: "ace1")!)
        tfAce2.text = String(describing: selectedMatch!.value(forKey: "ace2")!)
        tfDF1.text = String(describing: selectedMatch!.value(forKey: "df1")!)
        tfDF2.text = String(describing: selectedMatch!.value(forKey: "df2")!)
        tfWPP1.text = String(describing: selectedMatch!.value(forKey: "wpp1")!)
        tfWPP2.text = String(describing: selectedMatch!.value(forKey: "wpp2")!)
        tfWWP1.text = String(describing: selectedMatch!.value(forKey: "wwp1")!)
        tfWWP2.text = String(describing:selectedMatch!.value(forKey: "wwp1")!)
        tfWPPS1.text = String(describing: selectedMatch!.value(forKey: "wpps1")!)
        tfWPPS2.text = String(describing: selectedMatch!.value(forKey: "wpps2")!)
        tfWWPS1.text = String(describing: selectedMatch!.value(forKey: "wwps1")!)
        tfWWPS2.text = String(describing: selectedMatch!.value(forKey: "wwps2")!)
        tfBreak1.text = String(describing: selectedMatch!.value(forKey: "break1")!)
        tfBreak2.text = String(describing: selectedMatch!.value(forKey: "break2")!)
        tfActive1.text = String(describing: selectedMatch!.value(forKey: "active1")!)
        tfActive2.text = String(describing: selectedMatch!.value(forKey: "active2")!)
        tfFault1.text = String(describing:selectedMatch!.value(forKey: "fault1")!)
        tfFault2.text = String(describing:selectedMatch!.value(forKey: "fault2")!)
        tfGamesp1.text = String(describing: selectedMatch!.value(forKey: "gamesp1")!)
        tfGamesp2.text = String(describing: selectedMatch!.value(forKey: "gamesp2")!)
        tfGamep1.text = String(describing: selectedMatch!.value(forKey: "gamep1")!)
        tfGamep2.text = String(describing: selectedMatch!.value(forKey: "gamep2")!)
        
        if selectedMatch!.value(forKey: "winner") as! String == selectedMatch!.value(forKey: "name1") as! String{
            winnerSC.selectedSegmentIndex = 0
        } else {
            winnerSC.selectedSegmentIndex = 1
        }
        
        
        //testLabel.text = (selectedMatch!.value(forKey: "name1") as! String) + String(describing: selectedMatch!.value(forKey: "rating1")!) + (selectedMatch!.value(forKey: "name2") as! String) + String(describing: selectedMatch!.value(forKey: "rating2")!) + dateString + (selectedMatch!.value(forKey: "winner") as! String) + "--" + String(describing: selectedMatch!.value(forKey: "ace1")!) + "--" + String(describing: selectedMatch!.value(forKey: "ace2")!) + "--" + String(describing: selectedMatch!.value(forKey: "df1")!) + "--" + String(describing: selectedMatch!.value(forKey: "df2")!) + "--" + String(describing: selectedMatch!.value(forKey: "fault1")!) + "--" + String(describing: selectedMatch!.value(forKey: "fault2")!)
        
        
    }

}
