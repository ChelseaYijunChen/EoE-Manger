//
//  welcomeViewController.swift
//  EoE_1
//
//  Created by SUN on 15/12/6.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class welcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        userCheck()
    }
    
    
    func userCheck() {
        
        let userExist: Bool = DBManager.getInstance().checkUserExist(1)
        
        if userExist {
            jumpToFoodDiary()
            print(userExist)
        } else {
            jumpToUserInfo()
            print(userExist)

        }
    }
    
    
    func jumpToFoodDiary() {
        let alertView = UIAlertController(title: "", message: "You have registered, go to food Diary!", preferredStyle: .Alert)
        
        let jumpAction = UIAlertAction(title: "OK", style: .Default, handler: {
            Void in
            
            self.performSegueWithIdentifier("goToFoodDiary", sender: self)
            
        })
        
        alertView.addAction(jumpAction)
        presentViewController(alertView, animated: true, completion: nil)
    }
    
    
    func jumpToUserInfo() {
        let alertView = UIAlertController(title: "", message: "Please register first!", preferredStyle: .Alert)
        
        let jumpAction = UIAlertAction(title: "OK", style: .Default, handler: {
            Void in
            
            self.performSegueWithIdentifier("goToUserInfo", sender: self)
            
        })
        
        alertView.addAction(jumpAction)
        presentViewController(alertView, animated: true, completion: nil)
    }
    
    
}
