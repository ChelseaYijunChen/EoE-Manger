//
//  FeedingTubeViewController.swift
//  EoE_1
//
//  Created by SUN on 15/11/29.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class FeedingTubeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //----------------------label-------------------------
    
    
    @IBOutlet weak var s1title: UILabel!
    
    
    @IBOutlet weak var s1q1: UILabel!
    @IBOutlet weak var s1a1: UISegmentedControl!
    
    @IBOutlet weak var s1q2: UILabel!
    @IBOutlet weak var s1a2: UISegmentedControl!
    
    //----------------------init the view----------------
    
    let mainData = PedsQLData().feedingTubeData
    
    func initView() {
        
        s1title.text = mainData[0].title
        
        s1q1.text = mainData[0].questions[0]
        s1q2.text = mainData[0].questions[1]
        
    }
    
    //---------------------------------------------------
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
//    @IBAction func save(sender: UIBarButtonItem) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//    }
    
    
    
    

}
