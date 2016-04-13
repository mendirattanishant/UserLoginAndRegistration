//
//  ViewController.swift
//  UserLoginAndRegistration
//
//  Created by Nishant Mendiratta on 4/9/16.
//  Copyright © 2016 Nishant Mendiratta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        
        let button   = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(100, 100, 100, 50)
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("Logout", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        // Only Show if User is logged in
        let success = NSUserDefaults.standardUserDefaults().boolForKey("success");
        if(!success) {
            self.performSegueWithIdentifier("loginView", sender: self);
        }
    }
    func buttonAction(sender:UIButton!) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "success");
        NSUserDefaults.standardUserDefaults().synchronize();
        self.performSegueWithIdentifier("loginView", sender: self);
    }
}

