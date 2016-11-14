//
//  dietBaseViewController.swift
//  EoE_1
//
//  Created by SUN on 15/12/1.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class dietBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    var data = userSurvey()
    
    @IBAction func allergy(sender: UIButton) {
        
        self.data.allergy_syptoms = 1
        self.data.sixFood = 0
        self.data.sixFood_food = ""
        performSegueWithIdentifier("showTestFoodSubView", sender: self)
        
    }
    
    
    @IBAction func sixFood(sender: UIButton) {
        
        self.data.sixFood = 1
        self.data.allergy_syptoms = 0
        self.data.allergy_syptoms_food = ""
        performSegueWithIdentifier("showSixFoodSubView", sender: self)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTestFoodSubView" {
            
            let destination: testFoodChooseViewController = segue.destinationViewController as! testFoodChooseViewController
            
            destination.data = self.data
        } else if segue.identifier == "showSixFoodSubView" {
            
            let destination: sixFoodChooseViewController = segue.destinationViewController as! sixFoodChooseViewController
            
            destination.data = self.data
            
        }
        
        
    }
    
    
    
}
