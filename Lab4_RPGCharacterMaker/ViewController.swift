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
    
    @IBAction func updateStats(_ sender: UIStepper) {
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

