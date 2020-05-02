//
//  predictLiveVC.swift
//  TennisPredict
//
//  Created by Renat Gasanov on 03.05.2020.
//  Copyright © 2020 Renat Gasanov. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import CoreData

class predictLiveVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var textFieldName1: SkyFloatingLabelTextField!
    @IBOutlet weak var textFieldName2: SkyFloatingLabelTextField!
    @IBOutlet weak var tfRating1: SkyFloatingLabelTextField!
    @IBOutlet weak var tfRating2: SkyFloatingLabelTextField!
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

        title = "LIVE"
        
        addButton.layer.cornerRadius = 15
        addButton.layer.cornerCurve = .continuous
        
        textFieldName1.delegate = self
        textFieldName2.delegate = self
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(predictLiveVC.dismissPicker))

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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
    
    
    @IBAction func getPredict(_ sender: Any) {
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
    }
    
}
