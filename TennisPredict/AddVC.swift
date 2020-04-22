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
        

        let vc = ViewController()
        vc.saveMatch(name1: n1, name2: n2, rating1: r1, rating2: r2)
        
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
