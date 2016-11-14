//
//  PEESSScroViewController.swift
//  EoE_1
//
//  Created by SUN on 15/12/1.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class PEESSScroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //-------------------------labels--------------------------
    
    @IBOutlet weak var q1: UILabel!
    @IBOutlet weak var q1f: UISegmentedControl!
    @IBOutlet weak var q1s: UISegmentedControl!
    
    @IBOutlet weak var q2: UILabel!
    @IBOutlet weak var q2f: UISegmentedControl!
    @IBOutlet weak var q2s: UISegmentedControl!
    
    @IBOutlet weak var q3: UILabel!
    @IBOutlet weak var q3f: UISegmentedControl!
    @IBOutlet weak var q3s: UISegmentedControl!
    
    @IBOutlet weak var q4: UILabel!
    @IBOutlet weak var q4f: UISegmentedControl!
    @IBOutlet weak var q4s: UISegmentedControl!
    
    @IBOutlet weak var q5: UILabel!
    @IBOutlet weak var q5f: UISegmentedControl!
    @IBOutlet weak var q5s: UISegmentedControl!
    
    @IBOutlet weak var q6: UILabel!
    @IBOutlet weak var q6f: UISegmentedControl!
    @IBOutlet weak var q6s: UISegmentedControl!
    
    @IBOutlet weak var q7: UILabel!
    @IBOutlet weak var q7f: UISegmentedControl!
    @IBOutlet weak var q7s: UISegmentedControl!
    
    @IBOutlet weak var q8: UILabel!
    @IBOutlet weak var q8f: UISegmentedControl!
    @IBOutlet weak var q8s: UISegmentedControl!
    
    @IBOutlet weak var q9: UILabel!
    @IBOutlet weak var q9f: UISegmentedControl!
    @IBOutlet weak var q9s: UISegmentedControl!
    
    @IBOutlet weak var q10: UILabel!
    @IBOutlet weak var q10f: UISegmentedControl!
    
    @IBOutlet weak var q11: UILabel!
    @IBOutlet weak var q11f: UISegmentedControl!

    
    @IBOutlet weak var q21: UILabel!
    @IBOutlet weak var q22: UILabel!
    @IBOutlet weak var q23: UILabel!
    @IBOutlet weak var q24: UILabel!
    @IBOutlet weak var q25: UILabel!
    @IBOutlet weak var q26: UILabel!
    @IBOutlet weak var q27: UILabel!
    @IBOutlet weak var q28: UILabel!
    @IBOutlet weak var q29: UILabel!
    
    
    
    
    
    //----------------------init the view-------------------
    
    let mainData = PEESSData().questions
    
    func initView() {
        
        q1.text = mainData[0]
        q2.text = mainData[1]
        q3.text = mainData[2]
        q4.text = mainData[3]
        q5.text = mainData[4]
        q6.text = mainData[5]
        q7.text = mainData[6]
        q8.text = mainData[7]
        q9.text = mainData[8]
        q10.text = mainData[9]
        q11.text = mainData[10]
        
        q21.text = mainData[11]
        q22.text = mainData[12]
        q23.text = mainData[13]
        q24.text = mainData[14]
        q25.text = mainData[15]
        q26.text = mainData[16]
        q27.text = mainData[17]
        q28.text = mainData[18]
        q29.text = mainData[19]
        
    }
    
    //--------------------save------------------------------
    
    
    var data = PEESS()
    
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        
        saveToTemp()
        
        let isInserted = DBManager.getInstance().addPEESS(data)
        
        exDBManager.getInstance().addPeess(data)
        
        if isInserted {
        let alertView = UIAlertController(title: "", message: "PEESS Saved!", preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alertView, animated: true, completion: nil)
        } else {
            let alertView = UIAlertController(title: "", message: "Save failed!", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }

    }
    
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
        
        data.q1f = q1f.selectedSegmentIndex
        data.q1s = q1s.selectedSegmentIndex
        
        data.q2f = q2f.selectedSegmentIndex
        data.q2s = q2s.selectedSegmentIndex
        
        data.q3f = q3f.selectedSegmentIndex
        data.q3s = q3s.selectedSegmentIndex
        
        data.q4f = q4f.selectedSegmentIndex
        data.q4s = q4s.selectedSegmentIndex
        data.q5f = q5f.selectedSegmentIndex
        data.q5s = q5s.selectedSegmentIndex
        
        data.q6f = q6f.selectedSegmentIndex
        data.q6s = q6s.selectedSegmentIndex
        
        data.q7f = q7f.selectedSegmentIndex
        data.q7s = q7s.selectedSegmentIndex
        
        data.q8f = q8f.selectedSegmentIndex
        data.q8s = q8s.selectedSegmentIndex
        
        data.q9f = q9f.selectedSegmentIndex
        data.q9s = q9s.selectedSegmentIndex
        
        data.q10f = q10f.selectedSegmentIndex
        
        data.q11f = q11f.selectedSegmentIndex

    }
    

}
