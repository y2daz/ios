//
//  ViewController.swift
//  login
//
//  Created by IMM on 9/21/16.
//  Copyright © 2016 IMM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func lalalaIDoTihings(_: AnyObject) {
        let alertController = UIAlertController(title: "Login", message: "And stuff",
            preferredStyle: .Alert)
        
        let loginTextField = alertController.textFields![0] as UITextField
        let passwordTextField = alertController.textFields![1] as UITextField
        
        let loginAction = UIAlertAction(title: "Login", style: .Default)
            { (ACTION) -> Void in
                print("Login clicked")
        }
        loginAction.enabled = false
        
        let forgotPasswordAction = UIAlertAction(title: "Forgot Password", style: .Destructive)
            { (ACTION) -> Void in
                print("Remembering Password")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel)
            { (ACTION) -> Void in
                print("Cancelling Stuff")
        }
        
        alertController.addTextFieldWithConfigurationHandler
            { (textField) in
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

        
    }
    @IBAction func AlertAction(sender: AnyObject) {
        
            }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

