//
//  foodEliminationViewController.swift
//  EoE_1
//
//  Created by SUN on 15/12/1.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class foodEliminationViewController: UIViewController {

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
    
    
    @IBOutlet weak var eliminationControl: UISegmentedControl!
    
    @IBOutlet weak var dietControl: UISegmentedControl!
    
    
    @IBAction func eliminationChoose(sender: UISegmentedControl) {
        
        switch eliminationControl.selectedSegmentIndex {
        case 0:
            self.data.foodElimination = eliminationControl.selectedSegmentIndex
            break
        case 1:
            self.data.foodElimination = eliminationControl.selectedSegmentIndex
            performSegueWithIdentifier("showDietBase", sender: self)
        default:
            break
        }
    }
    
    
    @IBAction func dietChoose(sender: UISegmentedControl) {
        
        switch dietControl.selectedSegmentIndex {
        case 0:
            self.data.elementalDiet = dietControl.selectedSegmentIndex
            break
        case 1:
            self.data.elementalDiet = dietControl.selectedSegmentIndex
            performSegueWithIdentifier("showExclElemental", sender: self)
        default:
            break
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDietBase" {
            
            let destination: dietBaseViewController = segue.destinationViewController as! dietBaseViewController
            
            destination.data = self.data
            
        } else if segue.identifier == "showExclElemental" {
            
            let destination: ExclElementalViewController = segue.destinationViewController as! ExclElementalViewController
            
            destination.data = self.data
            
        }
        
        
    }
    
    
    @IBAction func unwindFromNoExclView (unwindSegue: UIStoryboardSegue) {
        let noExclView: ExclElementalViewController = unwindSegue.sourceViewController as! ExclElementalViewController
        
        self.data = noExclView.data
    }
    
    
    @IBAction func unwindFromNoFoodTrial (unwindSegue: UIStoryboardSegue) {
        let noFoodTrialView: foodTrialViewController = unwindSegue.sourceViewController as! foodTrialViewController
        
        self.data = noFoodTrialView.data
    }
    
    
    @IBAction func unwindFromFoodTrialView (unwindSegue: UIStoryboardSegue) {
        let foodTrialView: foodTrialChooseViewController = unwindSegue.sourceViewController as! foodTrialChooseViewController
        
        //print(foodTrialView.allFood[0])
    }
    
    
    @IBAction func unwindFromTestFoodView (unwindSegue: UIStoryboardSegue) {
        let testFoodView: testFoodChooseViewController = unwindSegue.sourceViewController as! testFoodChooseViewController
        
        //print(testFoodView.allFood[0])
        
    }
    
    @IBAction func unwindFromSixFoodView (unwindSegue: UIStoryboardSegue) {
        let sixFoodView: sixFoodChooseViewController = unwindSegue.sourceViewController as! sixFoodChooseViewController
        
        //print(sixFoodView.allFood[0])
    }
    
    
    
    

}
