//
//  EditVC.swift
//  TennisPredict
//
//  Created by Renat Gasanov on 01.05.2020.
//  Copyright © 2020 Renat Gasanov. All rights reserved.
//

import UIKit
import CoreData
import SkyFloatingLabelTextField

class EditVC: UIViewController, UITextFieldDelegate {
    
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
    @IBOutlet weak var editBTN: UIButton!
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Изменение"
        
        editBTN.layer.cornerRadius = 15
        editBTN.layer.cornerCurve = .continuous
        
        textFieldName1.delegate = self
        textFieldName2.delegate = self
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(EditVC.dateChanged(datePicker:)), for: .valueChanged)
        
        tfDate.inputView = datePicker
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(EditVC.dismissPicker))

        tfDate.inputAccessoryView = toolBar
        tfRating1.inputAccessoryView = toolBar
        tfRating2.inputAccessoryView = toolBar
        tfAce1.inputAccessoryView = toolBar
        tfAce2.inputAccessoryView = toolBar
        tfDF1.inputAccessoryView = toolBar
        tfDF2.inputAccessoryView = toolBar
        tfWPP1.inputAccessoryView = toolBar
        tfWPP2.inputAccessoryView = toolBar
        tfWWP1.inputAccessoryView = toolBar
        tfWWP2.inputAccessoryView = toolBar
        tfWPPS1.inputAccessoryView = toolBar
        tfWPPS2.inputAccessoryView = toolBar
        tfWWPS1.inputAccessoryView = toolBar
        tfWWPS2.inputAccessoryView = toolBar
        tfBreak1.inputAccessoryView = toolBar
        tfBreak2.inputAccessoryView = toolBar
        tfActive1.inputAccessoryView = toolBar
        tfActive2.inputAccessoryView = toolBar
        tfFault1.inputAccessoryView = toolBar
        tfFault2.inputAccessoryView = toolBar
        tfGamep1.inputAccessoryView = toolBar
        tfGamep2.inputAccessoryView = toolBar
        tfGamesp1.inputAccessoryView = toolBar
        tfGamesp2.inputAccessoryView = toolBar
        
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

    }
    
    @objc func dismissPicker() {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        tfDate.text = dateFormatter.string(from: datePicker.date)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }
    
    @IBAction func buttonEdit(_ sender: Any) {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = delegate.persistentContainer.viewContext
        
        let predicate = NSPredicate(format: "SELF = %@", selectedMatch!.objectID)
         
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Match")
        fetchRequest.predicate = predicate
         
        do {
            let fetchedEntities = try managedObjectContext.fetch(fetchRequest) as! [Match]
            
            var winner: String
            if winnerSC.selectedSegmentIndex == 0 {winner = textFieldName1.text!} else {winner = textFieldName2.text!}
            
            fetchedEntities.first?.name1 = textFieldName1.text
            fetchedEntities.first?.name2 = textFieldName2.text
            fetchedEntities.first?.date = datePicker!.date
            fetchedEntities.first?.winner = winner
            
            fetchedEntities.first?.rating1 = Int16(tfRating1.text!)!
            fetchedEntities.first?.rating2 = Int16(tfRating2.text!)!
            
            fetchedEntities.first?.ace1 = Int16(tfAce1.text!)!
            fetchedEntities.first?.ace2 = Int16(tfAce2.text!)!
            fetchedEntities.first?.df1 = Int16(tfDF1.text!)!
            fetchedEntities.first?.df2 = Int16(tfDF2.text!)!
            fetchedEntities.first?.wpp1 = Int16(tfWPP1.text!)!
            fetchedEntities.first?.wpp2 = Int16(tfWPP2.text!)!
            fetchedEntities.first?.wwp1 = Int16(tfWWP1.text!)!
            fetchedEntities.first?.wwp2 = Int16(tfWWP2.text!)!
            
            fetchedEntities.first?.wpps1 = Int16(tfWPPS1.text!)!
            fetchedEntities.first?.wpps2 = Int16(tfWPPS2.text!)!
            fetchedEntities.first?.wwps1 = Int16(tfWWPS1.text!)!
            fetchedEntities.first?.wwps2 = Int16(tfWWPS2.text!)!
            fetchedEntities.first?.break1 = Int16(tfBreak1.text!)!
            fetchedEntities.first?.break2 = Int16(tfBreak2.text!)!
            fetchedEntities.first?.active1 = Int16(tfActive1.text!)!
            fetchedEntities.first?.active2 = Int16(tfActive2.text!)!
            fetchedEntities.first?.fault1 = Int16(tfFault1.text!)!
            fetchedEntities.first?.fault2 = Int16(tfFault2.text!)!
            fetchedEntities.first?.gamesp1 = Int16(tfGamesp1.text!)!
            fetchedEntities.first?.gamesp2 = Int16(tfGamesp2.text!)!
            fetchedEntities.first?.gamep1 = Int16(tfGamep1.text!)!
            fetchedEntities.first?.gamep2 = Int16(tfGamep2.text!)!
            // ... Обновляем новые свойства с новыми значениями
        } catch {
            // что-то делаем в зависимости от ошибки
        }
         
        do {
            try managedObjectContext.save()
        } catch {
            // что-то делаем в зависимости от ошибки
        }
        navigationController?.popViewController(animated: true)
    }
    
}
