//
//  foodTrialViewController.swift
//  EoE_1
//
//  Created by SUN on 15/12/1.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class foodTrialViewController: UIViewController {

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
    
    
    @IBOutlet weak var trialControl: UISegmentedControl!
    
    
    @IBAction func trialChoose(sender: UISegmentedControl) {
        
        switch trialControl.selectedSegmentIndex {
        case 0:
            self.data.foodTrial = trialControl.selectedSegmentIndex
            break
        case 1:
            self.data.foodTrial = trialControl.selectedSegmentIndex
            performSegueWithIdentifier("showTrialList", sender: self)
            break
        default:
            break
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTrialList" {
            
            let destination: foodTrialChooseViewController = segue.destinationViewController as! foodTrialChooseViewController
            
            destination.data = self.data
            
        }
    }
    
    

}
