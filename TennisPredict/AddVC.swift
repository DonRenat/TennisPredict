//
//  AddVC.swift
//  TennisPredict
//
//  Created by Renat Gasanov on 20.04.2020.
//  Copyright © 2020 Renat Gasanov. All rights reserved.
//

import UIKit
import CoreData

class AddVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var textFieldName1: UITextField!
    @IBOutlet weak var textFieldName2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = 15
        addButton.layer.cornerCurve = .continuous
        
        textFieldName1.delegate = self
        textFieldName2.delegate = self
    }

    @IBAction func addNewMatch(_ sender: Any) {
        let n1 = textFieldName1.text!
        let n2 = textFieldName2.text!

        let vc = ViewController()
        vc.saveMatch(name1: n1, name2: n2)
        
        navigationController?.popViewController(animated: true)
        //self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
