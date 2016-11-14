//
//  PEESSViewController.swift
//  EoE_1
//
//  Created by SUN on 15/11/20.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class PEESSViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

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
    
    
    let PEESSQuestions = PEESSData()
    
    @IBOutlet weak var PEESSList: UITableView!
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PEESSQuestions.questions.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PEESSCell", forIndexPath: indexPath) as! PEESSTableViewCell
        
        cell.questionLabel.text = PEESSQuestions.questions[indexPath.row]
        
        if indexPath.row == 9 || indexPath.row == 10 {
            cell.severityControl.hidden = true
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 122
    }
    

}
