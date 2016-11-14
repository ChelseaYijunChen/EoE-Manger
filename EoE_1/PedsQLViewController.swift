//
//  PedsQLViewController.swift
//  EoE_1
//
//  Created by SUN on 15/11/29.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class PedsQLViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //-----------------labels--------------------------
    
    @IBOutlet weak var s1title: UILabel!
    
    @IBOutlet weak var s1q1: UILabel!
    @IBOutlet weak var s1a1: UISegmentedControl!
    
    @IBOutlet weak var s1q2: UILabel!
    @IBOutlet weak var s1a2: UISegmentedControl!
    
    @IBOutlet weak var s1q3: UILabel!
    @IBOutlet weak var s1a3: UISegmentedControl!
    
    @IBOutlet weak var s1q4: UILabel!
    @IBOutlet weak var s1a4: UISegmentedControl!
    
    @IBOutlet weak var s1q5: UILabel!
    @IBOutlet weak var s1a5: UISegmentedControl!
    
    @IBOutlet weak var sqq6: UILabel!
    @IBOutlet weak var s1a6: UISegmentedControl!
    
    
    @IBOutlet weak var s2title: UILabel!
    
    @IBOutlet weak var s2q1: UILabel!
    @IBOutlet weak var s2a1: UISegmentedControl!
    
    @IBOutlet weak var s2q2: UILabel!
    @IBOutlet weak var s2a2: UISegmentedControl!
    
    @IBOutlet weak var s2q3: UILabel!
    @IBOutlet weak var s2a3: UISegmentedControl!
    
    @IBOutlet weak var s2q4: UILabel!
    @IBOutlet weak var s2a4: UISegmentedControl!
    
    
    @IBOutlet weak var s3title: UILabel!
    
    @IBOutlet weak var s3q1: UILabel!
    @IBOutlet weak var s3a1: UISegmentedControl!
    
    @IBOutlet weak var s3q2: UILabel!
    @IBOutlet weak var s3a2: UISegmentedControl!
    
    @IBOutlet weak var s3q3: UILabel!
    @IBOutlet weak var s3a3: UISegmentedControl!
    
    @IBOutlet weak var s3q4: UILabel!
    @IBOutlet weak var s3a4: UISegmentedControl!
    
    @IBOutlet weak var s3q5: UILabel!
    @IBOutlet weak var sa5: UISegmentedControl!
    
    
    @IBOutlet weak var s4title: UILabel!
    
    @IBOutlet weak var s4q1: UILabel!
    @IBOutlet weak var s4a1: UISegmentedControl!
    
    @IBOutlet weak var s4q2: UILabel!
    @IBOutlet weak var s4a2: UISegmentedControl!
    
    @IBOutlet weak var s4q3: UILabel!
    @IBOutlet weak var s4a3: UISegmentedControl!
    
    @IBOutlet weak var s4q4: UILabel!
    @IBOutlet weak var s4a4: UISegmentedControl!
    
    @IBOutlet weak var s4q5: UILabel!
    @IBOutlet weak var s4a5: UISegmentedControl!
    
    @IBOutlet weak var s4q6: UILabel!
    @IBOutlet weak var s4a6: UISegmentedControl!
    
    
    @IBOutlet weak var s5title: UILabel!
    
    @IBOutlet weak var s5q1: UILabel!
    @IBOutlet weak var s5a1: UISegmentedControl!
    
    @IBOutlet weak var s5q2: UILabel!
    @IBOutlet weak var s5a2: UISegmentedControl!
    
    @IBOutlet weak var s5q3: UILabel!
    @IBOutlet weak var s5a3: UISegmentedControl!
    
    @IBOutlet weak var s5q4: UILabel!
    @IBOutlet weak var s5a4: UISegmentedControl!
    
    @IBOutlet weak var s5q5: UILabel!
    @IBOutlet weak var s5a5: UISegmentedControl!
    
    
    @IBOutlet weak var s6title: UILabel!
    @IBOutlet weak var s6a1: UISegmentedControl!
    
    
    @IBOutlet weak var s7title: UILabel!
    @IBOutlet weak var s7a1: UISegmentedControl!
    
    //-----------------init this view-------------------------
    
    let mainData = PedsQLData().Data
    
    func initView() {
        
        s1title.text = mainData[0].title
        s1q1.text = mainData[0].questions[0]
        s1q2.text = mainData[0].questions[1]
        s1q3.text = mainData[0].questions[2]
        s1q4.text = mainData[0].questions[3]
        s1q5.text = mainData[0].questions[4]
        sqq6.text = mainData[0].questions[5]
        
        s2title.text = mainData[1].title
        s2q1.text = mainData[1].questions[0]
        s2q2.text = mainData[1].questions[1]
        s2q3.text = mainData[1].questions[2]
        s2q4.text = mainData[1].questions[3]
        
        s3title.text = mainData[2].title
        s3q1.text = mainData[2].questions[0]
        s3q2.text = mainData[2].questions[1]
        s3q3.text = mainData[2].questions[2]
        s3q4.text = mainData[2].questions[3]
        s3q5.text = mainData[2].questions[4]
        
        s4title.text = mainData[3].title
        s4q1.text = mainData[3].questions[0]
        s4q2.text = mainData[3].questions[1]
        s4q3.text = mainData[3].questions[2]
        s4q4.text = mainData[3].questions[3]
        s4q5.text = mainData[3].questions[4]
        s4q6.text = mainData[3].questions[5]
        
        s5title.text = mainData[4].title
        s5q1.text = mainData[4].questions[0]
        s5q2.text = mainData[4].questions[1]
        s5q3.text = mainData[4].questions[2]
        s5q4.text = mainData[4].questions[3]
        s5q5.text = mainData[4].questions[4]
        
        s6title.text = mainData[5].questions[0]
        
        s7title.text = mainData[6].questions[0]
    }
    
   //---------------------save--------------------------------
    
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func save(sender: UIBarButtonItem) {
        
        
        saveToTemp()
        
        let isInserted = DBManager.getInstance().addPedsQL(data)
        
        exDBManager.getInstance().addPedsQL(data)
        
        if isInserted {
        let alertView = UIAlertController(title: "", message: "PedsQL Saved!", preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alertView, animated: true, completion: nil)
        } else {
            let alertView = UIAlertController(title: "", message: "Save failed!", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }

        
        
    }
    
    
    var data = PedsQL()
    
    func getTime () -> String {
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
        data.patienID = 1
        data.time = getTime()
        
        data.s1q1 = s1a1.selectedSegmentIndex
        data.s1q2 = s1a2.selectedSegmentIndex
        data.s1q3 = s1a3.selectedSegmentIndex
        data.s1q4 = s1a4.selectedSegmentIndex
        data.s1q5 = s1a5.selectedSegmentIndex
        data.s1q6 = s1a6.selectedSegmentIndex
        
        data.s2q1 = s2a1.selectedSegmentIndex
        data.s2q2 = s2a2.selectedSegmentIndex
        data.s2q3 = s2a3.selectedSegmentIndex
        data.s2q4 = s2a4.selectedSegmentIndex
        
        data.s3q1 = s1a1.selectedSegmentIndex
        data.s3q2 = s3a2.selectedSegmentIndex
        data.s3q3 = s3a3.selectedSegmentIndex
        data.s3q4 = s3a4.selectedSegmentIndex
        data.s3q5 = sa5.selectedSegmentIndex
        
        data.s4q1 = s4a1.selectedSegmentIndex
        data.s4q2 = s4a2.selectedSegmentIndex
        data.s4q3 = s4a3.selectedSegmentIndex
        data.s4q4 = s4a4.selectedSegmentIndex
        data.s4q5 = s4a5.selectedSegmentIndex
        data.s4q6 = s4a6.selectedSegmentIndex
        
        data.s5q1 = s5a1.selectedSegmentIndex
        data.s5q2 = s5a2.selectedSegmentIndex
        data.s5q3 = s5a3.selectedSegmentIndex
        data.s5q4 = s5a4.selectedSegmentIndex
        data.s5q5 = s5a5.selectedSegmentIndex
        
    }
    
    
    @IBAction func unwindFromFoodAllergy(unwindSegue: UIStoryboardSegue) {
        
        let allergyView: FoodAllergyViewController = unwindSegue.sourceViewController as! FoodAllergyViewController
        
        
        data.s6q1 = allergyView.s1a1.selectedSegmentIndex
        data.s6q2 = allergyView.s1a2.selectedSegmentIndex
        data.s6q3 = allergyView.s1a3.selectedSegmentIndex
        data.s6q4 = allergyView.s1a4.selectedSegmentIndex
        data.s7q1 = allergyView.s2a1.selectedSegmentIndex
        data.s7q2 = allergyView.s2a2.selectedSegmentIndex
        data.s7q3 = allergyView.s2a3.selectedSegmentIndex

        
        
    }
    
    @IBAction func unwindFromFeedingTube(unwindSegue: UIStoryboardSegue) {
        
        let feedingView: FeedingTubeViewController = unwindSegue.sourceViewController as! FeedingTubeViewController
        
        data.s8q1 = feedingView.s1a1.selectedSegmentIndex
        data.s8q2 = feedingView.s1a2.selectedSegmentIndex
        
    }
    
    
    
    @IBAction func toFoodAllergy(sender: UISegmentedControl) {
        
        switch s6a1.selectedSegmentIndex {
        case 0:
            data.s67 = s6a1.selectedSegmentIndex
            break
        case 1:
            data.s67 = s6a1.selectedSegmentIndex
            performSegueWithIdentifier("showFoodAllergy", sender: self)
            break
        default:
            break
        }
    }
    
    
    @IBAction func toFeedingTube(sender: UISegmentedControl) {
        
        switch s7a1.selectedSegmentIndex {
        case 0:
            data.s8 = s7a1.selectedSegmentIndex
            break
        case 1:
            data.s8 = s7a1.selectedSegmentIndex
            performSegueWithIdentifier("showFeedingTube", sender: self)
            break
        default:
            break
        }
    }
    
    
    
    
    
    

}
