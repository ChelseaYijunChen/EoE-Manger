//
//  ExclElementalViewController.swift
//  EoE_1
//
//  Created by SUN on 15/12/1.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class ExclElementalViewController: UIViewController {

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
    
    
    
    @IBOutlet weak var noFoodControl: UISegmentedControl!
    
    
    @IBOutlet weak var formulaControl: UISegmentedControl!
    
    
    @IBAction func noFoodChoose(sender: UISegmentedControl) {
        
        switch noFoodControl.selectedSegmentIndex {
        case 0:
            self.data.exclElemental = noFoodControl.selectedSegmentIndex
            break
        case 1:
            self.data.exclElemental = noFoodControl.selectedSegmentIndex
            break
        default:
            break
        }
    }
    
    
    @IBAction func formulaChoose(sender: UISegmentedControl) {
        
        switch formulaControl.selectedSegmentIndex {
        case 0:
            self.data.formula = formulaControl.selectedSegmentIndex
            break
        case 1:
            self.data.formula = formulaControl.selectedSegmentIndex
            performSegueWithIdentifier("showFoodTrial", sender: self)
            break
        default:
            break
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showFoodTrial" {
            
            let destination: foodTrialViewController = segue.destinationViewController as! foodTrialViewController
            
            destination.data = self.data
            
        }
        
        
        
        
    }
    
    
    
    

}
