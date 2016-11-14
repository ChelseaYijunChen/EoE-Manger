//
//  foodTrialSubChooseViewController.swift
//  EoE_1
//
//  Created by SUN on 15/12/1.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class foodTrialSubChooseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    @IBOutlet weak var foodField: UITextField!
    
}
