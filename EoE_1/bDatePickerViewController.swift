//
//  bDatePickerViewController.swift
//  EoE_1
//
//  Created by SUN on 15/11/21.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class bDatePickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.preferredContentSize = CGSizeMake(300, 300)
        bDatePicker.datePickerMode = UIDatePickerMode.Date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet weak var bDatePicker: UIDatePicker!
    
    
    

}
