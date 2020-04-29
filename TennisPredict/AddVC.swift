//
//  AddVC.swift
//  TennisPredict
//
//  Created by Renat Gasanov on 20.04.2020.
//  Copyright © 2020 Renat Gasanov. All rights reserved.
//

import UIKit
import CoreData
import SkyFloatingLabelTextField

class AddVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var addButton: UIButton!
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
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = 15
        addButton.layer.cornerCurve = .continuous
        
        textFieldName1.delegate = self
        textFieldName2.delegate = self
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(AddVC.dateChanged(datePicker:)), for: .valueChanged)
        
        tfDate.inputView = datePicker
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(AddVC.dismissPicker))

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
    }
    
    @objc func dismissPicker() {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        tfDate.text = dateFormatter.string(from: datePicker.date)
    }

    @IBAction func addNewMatch(_ sender: Any) {
        let n1 = textFieldName1.text!
        let n2 = textFieldName2.text!
        let r1 = Int(tfRating1.text!)!
        let r2 = Int(tfRating2.text!)!
        
        //var winner = textFieldName1.text!
        var winner: String
        if winnerSC.selectedSegmentIndex == 0 {winner = textFieldName1.text!} else {winner = textFieldName2.text!}
        
        let a1 = Int(tfAce1.text!)!
        let a2 = Int(tfAce2.text!)!
        let df1 = Int(tfDF1.text!)!
        let df2 = Int(tfDF2.text!)!
        let wpp1 = Int(tfWPP1.text!)!
        let wpp2 = Int(tfWPP2.text!)!
        let wwp1 = Int(tfWWP1.text!)!
        let wwp2 = Int(tfWWP2.text!)!
        
        //let dateFormatter = DateFormatter()
        //let d = dateFormatter.date(from: datePicker!.date)
        

        let vc = ViewController()
        vc.saveMatch(name1: n1, name2: n2, rating1: r1, rating2: r2, date: datePicker!.date, winner: winner, ace1: a1, ace2: a2, df1: df1, df2: df2, wpp1: wpp1, wpp2: wpp2, wwp1: wwp1, wwp2: wwp2, wpps1: 1, wpps2: 2, wwps1: 3, wwps2: 4, break1: 5, break2: 6, active1: 7, active2: 8, fault1: 9, fault2: 10, gamesp1: 11, gamesp2: 12, gamep1: 13, gamep2: 14)
        
        navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

extension UIToolbar {

func ToolbarPiker(mySelect : Selector) -> UIToolbar {

    let toolBar = UIToolbar()

    toolBar.barStyle = UIBarStyle.default
    toolBar.isTranslucent = true
    toolBar.tintColor = UIColor.init(named: "Yellow")
    toolBar.sizeToFit()

    let doneButton = UIBarButtonItem(title: "Готово", style: UIBarButtonItem.Style.done, target: self, action: mySelect)
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

    toolBar.setItems([ spaceButton, doneButton], animated: false)
    toolBar.isUserInteractionEnabled = true

    return toolBar
    }
}
