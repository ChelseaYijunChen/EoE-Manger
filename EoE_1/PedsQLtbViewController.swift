//
//  PedsQLtbViewController.swift
//  EoE_1
//
//  Created by SUN on 15/11/27.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit


class PedsQLtbViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBOutlet weak var PedsQLTable: UITableView!
    
    
    
    let allData = PedsQLData()
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return allData.Data.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.Data[section].questions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 5 {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("PedsQLCell_2", forIndexPath: indexPath) as! PedsQLCell_2
            cell.questionLabel.text = allData.Data[indexPath.section].questions[indexPath.row]
            
            if indexPath.row == 1 {
//                let cell = tableView.dequeueReusableCellWithIdentifier("PedsQLCell_2", forIndexPath: indexPath) as! PedsQLCell_2
//                cell.questionLabel.text = allData.Data[indexPath.section].questions[indexPath.row]
                cell.foodAllergyControl.hidden = true
            }
            
            return cell

        } else if indexPath.section == 8 {
            let cell = tableView.dequeueReusableCellWithIdentifier("PedsQLCell_3", forIndexPath: indexPath) as! PedsQLCell_3
            
            cell.feedingTubeLabel.text = allData.Data[indexPath.section].questions[indexPath.row]
            if indexPath.row == 1 {
                cell.feedingTubeControl.hidden = true
            }
            
            return cell
            
        } else {
        
            let cell = tableView.dequeueReusableCellWithIdentifier("PedsCell", forIndexPath: indexPath) as! PedsQLCell
        
            cell.questionLabel.text = allData.Data[indexPath.section].questions[indexPath.row]
            
            return cell

        }
        
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return allData.Data[section].title
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    
    
    
    
    
    
    
    
    

}
