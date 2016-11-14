//
//  sixFoodChooseViewController.swift
//  EoE_1
//
//  Created by SUN on 15/12/1.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class sixFoodChooseViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

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
    
    @IBOutlet weak var sixFoodList: UITableView!
    
    var allFood = [String]()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFood.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = sixFoodList.dequeueReusableCellWithIdentifier("cell")
        
        cell?.textLabel?.text = allFood[indexPath.row]
        
        return cell!
        
    }
    
    @IBAction func addFood(sender: UIButton) {
        performSegueWithIdentifier("showSixFoodSubView", sender: self)
    }
    
    
    @IBAction func unwindFromSixFoodSubView (unwindSegue: UIStoryboardSegue) {
        let subView: sixFoodSubChooseViewController = unwindSegue.sourceViewController as! sixFoodSubChooseViewController
        
        allFood.append(subView.foodField.text!)
        self.data.sixFood_food = self.data.sixFood_food + subView.foodField.text! + " "
        
        self.sixFoodList.reloadData()
    }
    
    
    
    
    
}
