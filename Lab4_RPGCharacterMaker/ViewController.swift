//
//  ViewController.swift
//  Lab4_RPGCharacterMaker
//
//  Created by Trevor Jedziniak on 9/29/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var strengthStepper: UIStepper!
    @IBOutlet weak var intelStepper: UIStepper!
    @IBOutlet weak var dexStepper: UIStepper!
    @IBOutlet weak var percpStepper: UIStepper!
    @IBOutlet weak var luckStepper: UIStepper!
    
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var intelLabel: UILabel!
    @IBOutlet weak var dexLabel: UILabel!
    @IBOutlet weak var percpLabel: UILabel!
    @IBOutlet weak var luckLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var mpLabel: UILabel!
    @IBOutlet weak var dodgeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    var strength:Int = 1
    var newHP:Int = 112
    @IBAction func updateStats(_ sender: UIStepper) {
        
        
        var newMP:Int
        var newDodge:Int
        
        var intel:Int
        var dex:Int
        var percep:Int
        var luck:Int
        
        strengthLabel.text = String(strengthStepper.value)
        intelLabel.text = String(intelStepper.value)
        dexLabel.text = String(dexStepper.value)
        percpLabel.text = String(percpStepper.value)
        luckLabel.text = String(luckStepper.value)
        strength = Int(strengthStepper.value)
        intel = Int(intelStepper.value)
        dex = Int(dexStepper.value)
        percep = Int(percpStepper.value)
        luck = Int(luckStepper.value)
        
        newHP = 10 + 100*strength + (dex*2)
        
        newMP = intel * 30 + (strength*5)
        
        newDodge = 5*dex + (percep * 5) + (luck*3)
        
        hpLabel.text = String(newHP)
        mpLabel.text = String(newMP)
        dodgeLabel.text = String(format: "%01d%%", newDodge)
        
        
        
        
    }
    @IBAction func showAlert(_ sender: UIButton) {
        var hp:Int?
        
        hp = Int(hpLabel.text ?? " ") ?? 112
        
        if hp! < 1 {
            //create a UIAlertController object
                     let alert=UIAlertController(title: "Not Legal", message: "Hitpoints must be greater than 0", preferredStyle: UIAlertController.Style.alert)
                     //create a UIAlertAction object for the button
                     let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertAction.Style.cancel, handler: nil)
                     alert.addAction(cancelAction) //adds the alert action to the alert object
                     let okAction=UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
                        
                     })
            
                     alert.addAction(okAction)
                     present(alert, animated: true, completion: nil)
        }
        else{
            //create a UIAlertController object
                     let alert=UIAlertController(title: " Legal", message: "No Stats Errors", preferredStyle: UIAlertController.Style.alert)
                     //create a UIAlertAction object for the button
                     let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertAction.Style.cancel, handler: nil)
                     alert.addAction(cancelAction) //adds the alert action to the alert object
                     let okAction=UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {action in
                     })
                     alert.addAction(okAction)
                     present(alert, animated: true, completion: nil)
        }
        
    }
    func updateName(){
        
        nameLabel.text = nameField.text

    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            updateName()
        }
    
    override func viewDidLoad() {
        nameField.delegate=self
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(self.dismissKeyboard))
         view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
     if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
     if self.view.frame.origin.y == 0 {
     self.view.frame.origin.y -= keyboardSize.height
     }
     }
     }
     @objc func keyboardWillHide(notification: NSNotification) {
     if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue)
    != nil {
     if self.view.frame.origin.y != 0 {
     self.view.frame.origin.y = 0
     }
     }
     }

}

