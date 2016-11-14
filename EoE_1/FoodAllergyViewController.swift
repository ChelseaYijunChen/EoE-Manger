//
//  FoodAllergyViewController.swift
//  EoE_1
//
//  Created by SUN on 15/11/29.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class FoodAllergyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //----------------------label---------------------------
    
    @IBOutlet weak var s1title: UILabel!
    
    @IBOutlet weak var s1q1: UILabel!
    @IBOutlet weak var s1a1: UISegmentedControl!
    
    @IBOutlet weak var s1q2: UILabel!
    @IBOutlet weak var s1a2: UISegmentedControl!
    
    @IBOutlet weak var s1q3: UILabel!
    @IBOutlet weak var s1a3: UISegmentedControl!
    
    @IBOutlet weak var s1q4: UILabel!
    @IBOutlet weak var s1a4: UISegmentedControl!
    
    
    @IBOutlet weak var s2title: UILabel!
    
    @IBOutlet weak var s2q1: UILabel!
    @IBOutlet weak var s2a1: UISegmentedControl!
    
    @IBOutlet weak var s2q2: UILabel!
    @IBOutlet weak var s2a2: UISegmentedControl!
    
    @IBOutlet weak var s2q3: UILabel!
    @IBOutlet weak var s2a3: UISegmentedControl!
    
    //---------------------init the view---------------------
    
    let mainData = PedsQLData().foodAllergyData
    
    func initView() {
        
        s1title.text = mainData[0].title
        s1q1.text = mainData[0].questions[0]
        s1q2.text = mainData[0].questions[1]
        s1q3.text = mainData[0].questions[2]
        s1q4.text = mainData[0].questions[3]
        
        s2title.text = mainData[1].title
        s2q1.text = mainData[1].questions[0]
        s2q2.text = mainData[1].questions[1]
        s2q3.text = mainData[1].questions[2]
        
    }
    
    //------------------------------------------------------
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
//    @IBAction func save(sender: UIBarButtonItem) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
    
    
    
    
    
}
