//
//  foodTrialChooseViewController.swift
//  EoE_1
//
//  Created by SUN on 15/12/1.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class foodTrialChooseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

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
    
    
    var data = userSurvey()
    
    
    
    @IBOutlet weak var foodList: UITableView!
    
    var allFood = [String]()
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFood.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = foodList.dequeueReusableCellWithIdentifier("cell")
        cell?.textLabel?.text = allFood[indexPath.row]
        return cell!
    }
    
    
    
    
    @IBAction func addFood(sender: UIButton) {
        performSegueWithIdentifier("showFoodTrialSubView", sender: self)
    }
    
    
    
    @IBAction func unwindFromFoodTrialSubView (unwindSegue: UIStoryboardSegue) {
        let subView: foodTrialSubChooseViewController = unwindSegue.sourceViewController as! foodTrialSubChooseViewController
        
        allFood.append(subView.foodField.text!)
        
        self.data.foodTrial_food = self.data.foodTrial_food + subView.foodField.text! + " "
        
        foodList.reloadData()
        
    }
    
    
    
    
}
