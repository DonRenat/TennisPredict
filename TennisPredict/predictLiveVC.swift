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
    
    @IBOutlet weak var predictLabel: UILabel!
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
    
    var activeTextField : SkyFloatingLabelTextField? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(predictLiveVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(predictLiveVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        title = "LIVE"
        
        addButton.layer.cornerRadius = 15
        addButton.layer.cornerCurve = .continuous
        
        textFieldName1.delegate = self
        textFieldName2.delegate = self
        
        tfFault1.delegate = self
        tfFault2.delegate = self
        tfGamesp1.delegate = self
        tfGamesp2.delegate = self
        tfGamep1.delegate = self
        tfGamep2.delegate = self
        
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
    
    @objc func keyboardWillShow(notification: NSNotification) {

      guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {

        // if keyboard size is not available for some reason, dont do anything
        return
      }

      var shouldMoveViewUp = false

      // if active text field is not nil
      if let activeTextField = activeTextField {

        let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
        
        let topOfKeyboard = self.view.frame.height - keyboardSize.height

        // if the bottom of Textfield is below the top of keyboard, move up
        if bottomOfTextField > topOfKeyboard {
          shouldMoveViewUp = true
        }
      }

      if(shouldMoveViewUp) {
        self.view.frame.origin.y = 0 - keyboardSize.height
      }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
      // move back the root view origin to zero
      self.view.frame.origin.y = 0
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
    
    func calcWinrate(name: String)->Float{
        var won: Float = 0
        var lost: Float = 0
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = delegate.persistentContainer.viewContext
        
        let predicate1 = NSPredicate(format: "name1 == %@", name)
        let predicate2 = NSPredicate(format: "name2 == %@", name)
        
        let predicateFinal:NSPredicate  = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate1, predicate2] )

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Match")
        fetchRequest.predicate = predicateFinal

        do {
            let fetchedEntities = try managedObjectContext.fetch(fetchRequest) as! [Match]
            
            for entity in fetchedEntities {
                if entity.winner == name {won+=1} else {lost+=1}
                //entity.FirstPropertyToUpdate = NewValue
                //entity.SecondPropertyToUpdate = NewValue
            }
        } catch {}

        return won/(won+lost)
        //do {try managedObjectContext.save()} catch {}
    }
    
    func calcH2H(name1: String, name2: String)->[Float]{
        var won1: Float = 0
        var won2: Float = 0
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = delegate.persistentContainer.viewContext
        
        let predicate1 = NSPredicate(format: "name1 == %@", name1)
        let predicate2 = NSPredicate(format: "name2 == %@", name2)
        let predicate12:NSPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate1, predicate2] )
        
        let predicate3 = NSPredicate(format: "name1 == %@", name2)
        let predicate4 = NSPredicate(format: "name2 == %@", name1)
        let predicate34:NSPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate3, predicate4] )
        
        let predicateFinal:NSPredicate  = NSCompoundPredicate(orPredicateWithSubpredicates: [predicate12, predicate34] )
        
        //let predicateFinal:NSPredicate  = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate1, predicate2] )

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Match")
        fetchRequest.predicate = predicateFinal

        do {
            let fetchedEntities = try managedObjectContext.fetch(fetchRequest) as! [Match]
            
            for entity in fetchedEntities {
                //if (entity.name1 == name1 && entity.winner == name1) {won1+=1} else {won2+=1}
                //if (entity.name2 == name1 && entity.winner == name1) {won1+=1} else {won2+=1}
                if entity.winner == name1 {won1+=1} else {won2+=1}
                //entity.FirstPropertyToUpdate = NewValue
                //entity.SecondPropertyToUpdate = NewValue
            }
        } catch {}

        return [won1/(won1+won2), won2/(won1+won2)]
        //do {try managedObjectContext.save()} catch {}
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
        
        if numberOFerrors == 0 {
            let n1: String = textFieldName1.text!
            let n2: String = textFieldName2.text!
            let r1 = Int(tfRating1.text!)!
            let r2 = Int(tfRating2.text!)!
            
            var M1: Float
            var M2: Float
            
            if case 1...3 = r1 {
                M1 = Float(pow((Float(200-r1)), 2.1))
            } else {
                M1 = Float(pow((Float(200-r1)), 2.0))
            }
            
            if case 1...3 = r2 {
                M2 = Float(pow((Float(200-r2)), 2.1))
            } else {
                M2 = Float(pow((Float(200-r2)), 2.0))
            }
            
            let R1 = Float(M1/(M1+M2))
            let R2 = Float(M2/(M1+M2))
            
            let h2h1: Float = calcH2H(name1: n1, name2: n2)[0]
            let h2h2: Float = calcH2H(name1: n1, name2: n2)[1]
            
            let final1: Float = R1 + calcWinrate(name: n1) + h2h1
            let final2: Float = R2 + calcWinrate(name: n2) + h2h2
                
            let final1NON2H: Float = R1 + calcWinrate(name: n1)
            let final2NOH2H: Float = R2 + calcWinrate(name: n2)
            
            if (calcWinrate(name: n1).isNaN || calcWinrate(name: n2).isNaN) {predictLabel.text! = "Статистика для одного из игроков отсутствует!"} else if h2h1.isNaN {predictLabel.text! = "Прогноз" + "\n" + String(format: "Rating %@: %.2f %@: %.2f", String(n1), R1, String(n2), R2) + "\n" + String(format: "Winrate %@: %.2f %@: %.2f", String(n1), calcWinrate(name: n1), String(n2), calcWinrate(name: n2)) + "\n" + String(format: "Final %@: %.2f %@: %.2f", String(n1), final1NON2H/(final1NON2H+final2NOH2H), String(n2), final2NOH2H/(final1NON2H+final2NOH2H))} else {
            predictLabel.text! = "Прогноз" + "\n" + String(format: "Rating %@: %.2f %@: %.2f", String(n1), R1, String(n2), R2) + "\n" + String(format: "Winrate %@: %.2f %@: %.2f", String(n1), calcWinrate(name: n1), String(n2), calcWinrate(name: n2)) + "\n" + String(format: "H2H %@: %.2f %@: %.2f", String(n1), h2h1, String(n2), h2h2) + "\n" + String(format: "Final %@: %.2f %@: %.2f", String(n1), final1/(final1+final2), String(n2), final2/(final1+final2))
            }
        }
    }
    
}

extension predictLiveVC {
  // when user select a textfield, this method will be called
  func textFieldDidBeginEditing(_ textField: UITextField) {
    // set the activeTextField to the selected textfield
    self.activeTextField = textField as! SkyFloatingLabelTextField
  }
    
  // when user click 'done' or dismiss the keyboard
  func textFieldDidEndEditing(_ textField: UITextField) {
    self.activeTextField = nil
  }
}
