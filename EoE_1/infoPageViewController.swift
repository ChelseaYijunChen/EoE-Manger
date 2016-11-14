//
//  infoPageViewController.swift
//  EoE_1
//
//  Created by SUN on 15/11/23.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class infoPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

}
