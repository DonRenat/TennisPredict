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
    
    private var datePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Добавление"
        
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
        
        tfDate.addTarget(self, action: #selector(textFieldDate(_:)), for: .editingChanged)
        
        textFieldName1.addTarget(self, action: #selector(textFieldName(_:)), for: .editingChanged)
        textFieldName2.addTarget(self, action: #selector(textFieldName(_:)), for: .editingChanged)
        
        tfRating1.addTarget(self, action: #selector(textFieldRating(_:)), for: .editingChanged)
        tfRating2.addTarget(self, action: #selector(textFieldRating(_:)), for: .editingChanged)
        
        tfAce1.addTarget(self, action: #selector(textFieldACEandDF(_:)), for: .editingChanged)
        tfAce2.addTarget(self, action: #selector(textFieldACEandDF(_:)), for: .editingChanged)
        tfDF1.addTarget(self, action: #selector(textFieldACEandDF(_:)), for: .editingChanged)
        tfDF2.addTarget(self, action: #selector(textFieldACEandDF(_:)), for: .editingChanged)
        
        tfWPP1.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfWPP2.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfWWP1.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfWWP2.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfWPPS1.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfWPPS2.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfWWPS1.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfWWPS2.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfBreak1.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfBreak2.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfActive1.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfActive2.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfFault1.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfFault2.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfGamep1.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfGamep2.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfGamesp1.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
        tfGamesp2.addTarget(self, action: #selector(textFieldOther(_:)), for: .editingChanged)
    }
    
    @objc func textFieldName(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                if(text == "") {
                    floatingLabelTextField.errorMessage = "Ошибка значения!"
                }
                else {
                    // The error message will only disappear when we reset it to nil or empty string
                    floatingLabelTextField.errorMessage = ""
                }
                do {
                    let regex = try NSRegularExpression(pattern: ".*[^а-яА-Я ].*", options: [])
                    if regex.firstMatch(in: text, options: [], range: NSMakeRange(0, text.count)) != nil {
                         floatingLabelTextField.errorMessage = "Ошибка значения!"

                    } else {
                        //floatingLabelTextField.errorMessage = ""
                    }
                }
                catch {

                }
            }
        }
    }
    
    @objc func textFieldRating(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                if(Int(text) ?? -1 < 0 || Int(text) ?? -1 > 200) {
                    floatingLabelTextField.errorMessage = "Ошибка значения!"
                }
                else {
                    // The error message will only disappear when we reset it to nil or empty string
                    floatingLabelTextField.errorMessage = ""
                }
            }
        }
    }
    
    @objc func textFieldDate(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                if(text == "") {
                    floatingLabelTextField.errorMessage = "Ошибка значения!"
                }
                else {
                    // The error message will only disappear when we reset it to nil or empty string
                    floatingLabelTextField.errorMessage = ""
                }
            }
        }
    }
    
    @objc func textFieldOther(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                if(Int(text) ?? -1 < 0 || Int(text) ?? -1 > 100) {
                    floatingLabelTextField.errorMessage = "Ошибка значения!"
                }
                else {
                    // The error message will only disappear when we reset it to nil or empty string
                    floatingLabelTextField.errorMessage = ""
                }
            }
        }
    }
    
    @objc func textFieldACEandDF(_ textfield: UITextField) {
        if let text = textfield.text {
            if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
                if(Int(text) ?? -1 < 0) {
                    floatingLabelTextField.errorMessage = "Ошибка значения!"
                }
                else {
                    // The error message will only disappear when we reset it to nil or empty string
                    floatingLabelTextField.errorMessage = ""
                }
            }
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
    
    func getAllTextFields(fromView view: UIView)-> [SkyFloatingLabelTextField] {
        return view.subviews.flatMap { (view) -> [SkyFloatingLabelTextField]? in
            if view is SkyFloatingLabelTextField {
                return [(view as! SkyFloatingLabelTextField)]
            } else {
                return getAllTextFields(fromView: view)
            }
        }.flatMap({$0})
    }

    @IBAction func addNewMatch(_ sender: Any) {
        
        textFieldDate(tfDate)
        textFieldName(textFieldName1)
        textFieldName(textFieldName2)
        textFieldRating(tfRating1)
        textFieldRating(tfRating2)
        textFieldACEandDF(tfAce1)
        textFieldACEandDF(tfAce2)
        textFieldACEandDF(tfDF1)
        textFieldACEandDF(tfDF2)
        textFieldOther(tfWPP1)
        textFieldOther(tfWPP2)
        textFieldOther(tfWWP1)
        textFieldOther(tfWWP2)
        textFieldOther(tfWPPS1)
        textFieldOther(tfWPPS2)
        textFieldOther(tfWWPS1)
        textFieldOther(tfWWPS2)
        textFieldOther(tfBreak1)
        textFieldOther(tfBreak2)
        textFieldOther(tfActive1)
        textFieldOther(tfActive2)
        textFieldOther(tfFault1)
        textFieldOther(tfFault2)
        textFieldOther(tfGamep1)
        textFieldOther(tfGamep2)
        textFieldOther(tfGamesp1)
        textFieldOther(tfGamesp2)
        
        var numberOFerrors: Int = 0
        let allTF = getAllTextFields(fromView : self.view)//.map{($0.text = "Hey dude!")}
        for tf in allTF
        {
            if tf.errorMessage != "" {numberOFerrors+=1}
        }
        print(numberOFerrors)
        
        if numberOFerrors == 0 {
        
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
        
        let wpps1 = Int(tfWPPS1.text!)!
        let wpps2 = Int(tfWPPS2.text!)!
        let wwps1 = Int(tfWWPS1.text!)!
        let wwps2 = Int(tfWWPS2.text!)!
        let break1 = Int(tfBreak1.text!)!
        let break2 = Int(tfBreak2.text!)!
        let active1 = Int(tfActive1.text!)!
        let active2 = Int(tfActive2.text!)!
        let fault1 = Int(tfFault1.text!)!
        let fault2 = Int(tfFault2.text!)!
        let gamesp1 = Int(tfGamesp1.text!)!
        let gamesp2 = Int(tfGamesp2.text!)!
        let gamep1 = Int(tfGamep1.text!)!
        let gamep2 = Int(tfGamep2.text!)!
        
        //let dateFormatter = DateFormatter()
        //let d = dateFormatter.date(from: datePicker!.date)
        

        let vc = ViewController()
        vc.saveMatch(name1: n1, name2: n2, rating1: r1, rating2: r2, date: datePicker!.date, winner: winner, ace1: a1, ace2: a2, df1: df1, df2: df2, wpp1: wpp1, wpp2: wpp2, wwp1: wwp1, wwp2: wwp2, wpps1: wpps1, wpps2: wpps2, wwps1: wwps1, wwps2: wwps2, break1: break1, break2: break2, active1: active1, active2: active2, fault1: fault1, fault2: fault2, gamesp1: gamesp1, gamesp2: gamesp2, gamep1: gamep1, gamep2:  gamep2)
        
        navigationController?.popViewController(animated: true)
        }
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
