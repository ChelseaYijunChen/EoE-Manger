//
//  raceChooseViewController.swift
//  EoE_1
//
//  Created by SUN on 15/11/21.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class raceChooseViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.preferredContentSize = CGSizeMake(300, 300)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var raceList: UITableView!
    
    @IBOutlet weak var raceField: UITextField!
    
    var race = ["American Indian or Alaska Native",
        "Asian(Indian,Japanese,Chinese,Korean,Vietnamese,etc)",
        "Black or African American",
        "Pacific Islander(Native Hawaiian,Samoan,Guamanian/Chamorro)",
        "White",
        "Other"
    ]
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return race.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("raceCell", forIndexPath: indexPath) as! raceListTableViewCell
        
        cell.raceLabel.text = race[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    
    var chosenRace: String = String()
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if cell?.accessoryType == .Checkmark {
            cell?.accessoryType = .None
            //cell?.highlighted = false
        } else {
            cell?.accessoryType = .Checkmark
            //cell?.highlighted = true
        }
        
        chosenRace = race[indexPath.row]
        
        raceField.text = chosenRace
        
    }
    
    

    
    
    
    
    
    
    
    
    
    
    

}
