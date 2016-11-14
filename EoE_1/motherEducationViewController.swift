//
//  motherEducationViewController.swift
//  EoE_1
//
//  Created by SUN on 15/11/22.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class motherEducationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var educationList: UITableView!
    
    @IBOutlet weak var eduField: UITextField!
    
    
    let education = ["Less than 9th grade",
        "9-12 grade, no diploma",
        "High school graduate(or GED/equivalent)",
        "Associate degree or Vocational training",
        "Some college(no degree)",
        "Bechelor degree",
        "Graduate or professional degree",
        "Other",
        "Not Applicable"
    ]
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("motherEducationCell", forIndexPath: indexPath) as! motherEductionTableViewCell
        
        cell.educationLabel.text = education[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return education.count
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    var chosenLevel: String = String()
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if cell?.accessoryType == .Checkmark {
            cell?.accessoryType = .None
        } else {
            cell?.accessoryType = .Checkmark
        }
        
        chosenLevel = education[indexPath.row]
        eduField.text = chosenLevel
    }
    
    
    

}
