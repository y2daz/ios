//
//  ViewController.swift
//  Alert
//
//  Created by IMM on 9/21/16.
//  Copyright © 2016 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func AlertAction(_: AnyObject) {
        
        let alertController = UIAlertController(title: "Login Window", message: "Enter Details", preferredStyle: .Alert)
        
        let loginAction = UIAlertAction(title: "Login", style: .Default)
            { (ACTION) in
                let loginTextField = alertController.textFields![0] as
                UITextField
                let passwordTextField = alertController.textFields![1] as
                UITextField
                //login(loginTextField.text, passwordTextField.text)
        }
        loginAction.enabled = false
        let forgotPasswordAction = UIAlertAction(title: "Forgot Password", style: .Destructive) { (_) in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel)
            { (_) in }
        alertController.addTextFieldWithConfigurationHandler {
            (textField) in
            textField.placeholder = "Login"
            
            NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: textField, queue:
                NSOperationQueue.mainQueue()) { (notification) in
                    loginAction.enabled = textField.text != ""
            }
        }
        alertController.addTextFieldWithConfigurationHandler {
            (textField) in
            textField.placeholder = "Password"
            textField.secureTextEntry = true
        }
        alertController.addAction(loginAction)
        alertController.addAction(forgotPasswordAction)
        alertController.addAction(cancelAction)
             self.presentViewController(alertController, animated: true, completion: nil)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    }


