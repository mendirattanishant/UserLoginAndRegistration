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
            displayMyAlertMessages("All fields muct be filled");
            return;
        }
        
        //check if passwords match 
        if(userPassword != userConfirmPassword) {
            //Display alert Messages
            displayMyAlertMessages("Passwords do not match ");
            return;
        }
        //Store data
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword")
        NSUserDefaults.standardUserDefaults().synchronize();
        
        //Display Alert Messages
        
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
