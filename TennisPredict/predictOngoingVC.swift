//
//  predictOngoingVC.swift
//  TennisPredict
//
//  Created by Renat Gasanov on 02.05.2020.
//  Copyright © 2020 Renat Gasanov. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import CoreData

class predictOngoingVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var name1TF: SkyFloatingLabelTextField!
    @IBOutlet weak var name2TF: SkyFloatingLabelTextField!
    @IBOutlet weak var rating1TF: SkyFloatingLabelTextField!
    @IBOutlet weak var rating2TF: SkyFloatingLabelTextField!
    @IBOutlet weak var predictButton: UIButton!
    @IBOutlet weak var predictLabel: UILabel!
    
    var activeTextField : SkyFloatingLabelTextField? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Предстоящий"
        
        predictButton.layer.cornerRadius = 15
        predictButton.layer.cornerCurve = .continuous
        
        name1TF.delegate = self
        name2TF.delegate = self
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(predictOngoingVC.dismissPicker))

        rating1TF.inputAccessoryView = toolBar
        rating2TF.inputAccessoryView = toolBar
        
        name1TF.addTarget(self, action: #selector(textFieldName(_:)), for: .editingChanged)
        name2TF.addTarget(self, action: #selector(textFieldName(_:)), for: .editingChanged)
        
        rating1TF.addTarget(self, action: #selector(textFieldRating(_:)), for: .editingChanged)
        rating2TF.addTarget(self, action: #selector(textFieldRating(_:)), for: .editingChanged)
    }
    
    @objc func dismissPicker() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
        //(200 – рейтинг)^2(%) + процент побед(%) + история матчей(%)
        
        textFieldName(name1TF)
        textFieldName(name2TF)
        textFieldRating(rating1TF)
        textFieldRating(rating2TF)
        
        var numberOFerrors: Int = 0
        let allTF = getAllTextFields(fromView : self.view)//.map{($0.text = "Hey dude!")}
        for tf in allTF
        {
            if tf.errorMessage != "" {numberOFerrors+=1}
        }
        print(numberOFerrors)
        
        if numberOFerrors == 0 {
            let n1: String = name1TF.text!
            let n2: String = name2TF.text!
            let r1 = Int(rating1TF.text!)!
            let r2 = Int(rating2TF.text!)!
            
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

extension predictOngoingVC {
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
