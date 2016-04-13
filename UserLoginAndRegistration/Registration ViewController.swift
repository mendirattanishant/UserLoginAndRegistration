//
//  Registration ViewController.swift
//  UserLoginAndRegistration
//
//  Created by Nishant Mendiratta on 4/12/16.
//  Copyright © 2016 Nishant Mendiratta. All rights reserved.
//

import UIKit

class Registration_ViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userConfirmPasswordTextField: UITextField!
    let storeUserEmail = "userEmail";
    let storeUserPassword = "userPassword";
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userConfirmPassword = userConfirmPasswordTextField.text;
        
        //check for empty field
        if(userEmail!.isEmpty || userPassword!.isEmpty || userConfirmPassword!.isEmpty) {
            displayMyAlertMessages("All fields must be filled");
            return;
        }
        
        //check if passwords match 
        if(userPassword != userConfirmPassword) {
            //Display alert Messages
            displayMyAlertMessages("Passwords do not match ");
            return;
        }
        //Store data
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: storeUserEmail)
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: storeUserPassword)
        //NSUserDefaults.standardUserDefaults().synchronize();
        
        //Display Alert Messages with confirmation
        let myAlert = UIAlertController(title: "Alert", message: "Successfully Registered", preferredStyle: UIAlertControllerStyle.Alert);
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                action in
            self.dismissViewControllerAnimated(true, completion:nil)
            
        }
        
        //Showing alert
        myAlert.addAction(action);
        self.presentViewController(myAlert, animated: true, completion:nil);
        
    }
    func displayMyAlertMessages(userMessage:String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(action);
        self.presentViewController(myAlert, animated: true  , completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
