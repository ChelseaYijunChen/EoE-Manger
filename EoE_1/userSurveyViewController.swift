//
//  userSurveyViewController.swift
//  EoE_1
//
//  Created by SUN on 15/11/22.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class userSurveyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //initTestData(data)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBOutlet weak var steroidsControl: UISegmentedControl!
    
    @IBOutlet weak var therapyControl: UISegmentedControl!
    
    //--------------------declare data-----------------------------
    var data = userSurvey()
    
    @IBAction func therapyChoose(sender: UISegmentedControl) {
        
        switch therapyControl.selectedSegmentIndex {
        case 0:
            print("choose 0")
            break
        case 1:
            data.dietary = therapyControl.selectedSegmentIndex
            performSegueWithIdentifier("showFoodElimination", sender: self)
            break
        default:
            break
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showFoodElimination" {
            let destination = segue.destinationViewController as! foodEliminationViewController
            destination.data = self.data
        }
        
    }
    
    
    
    
    
    @IBAction func save(sender: UIBarButtonItem) {
        
        saveToTemp()
        printData(data)
        
        let isInserted = DBManager.getInstance().addUserSurvey(data)
        
        exDBManager.getInstance().addUserSurvey(data)
        
        if isInserted {
        let alertView = UIAlertController(title: "", message: "User survey Saved!", preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alertView, animated: true, completion: nil)
        } else {
            let alertView = UIAlertController(title: "", message: "Save failed!", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }
        
    }
    
    

    
    
    @IBAction func unwindFromNoEliminationView (unwindSegue: UIStoryboardSegue) {
        let noEliminationView: foodEliminationViewController = unwindSegue.sourceViewController as! foodEliminationViewController
        
        self.data = noEliminationView.data
    }
    
    //---------------------------------save-----------------------------------
    func getTime() -> String {
        var time: String = String()
        
        let date = NSDate()
        
        let formatterTime = NSDateFormatter()
        formatterTime.timeStyle = .ShortStyle
        let time1 = formatterTime.stringFromDate(date)
        
        let formatterDate = NSDateFormatter()
        formatterDate.dateStyle = .ShortStyle
        let time2 = formatterDate.stringFromDate(date)
        
        time = time2 + " " + time1
        return time
    }
    
    
    
    func saveToTemp() {
        data.patientID = 1
        data.time = getTime()
        
        data.steroid = steroidsControl.selectedSegmentIndex
        //data.dietary = therapyControl.selectedSegmentIndex
        
    }
    
    //--------------------print test---------------------------------------
    
    func printData(d: userSurvey) {
        print(d.patientID)
        print(d.time)
        print(d.steroid)
        print(d.dietary)
        print(d.foodElimination)
        print(d.allergy_syptoms)
        print(d.allergy_syptoms_food)
        print(d.sixFood)
        print(d.sixFood_food)
        print(d.elementalDiet)
        print(d.exclElemental)
        print(d.formula)
        print(d.foodTrial)
        print(d.foodTrial_food)


    }
    
    //------------------init test------------------------------
    
//    func initTestData(d: userSurvey) {
//        d.patientID = 0
//        d.steroid = 0
//        d.dietary = 0
//        d.foodElimination = 1
//        d.elementalDiet = 1
//    }
//    
    
    
    
    
    

}
