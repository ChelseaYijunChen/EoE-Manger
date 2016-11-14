//
//  testFoodChooseViewController.swift
//  EoE_1
//
//  Created by SUN on 15/12/1.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class testFoodChooseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

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
        performSegueWithIdentifier("showAllergySymptomFood", sender: self)
    }
    
    
    
    
    @IBAction func unwindFromTestFoodSubView (unwindSegue: UIStoryboardSegue) {
        let subView: testFoodSubChooseViewController = unwindSegue.sourceViewController as! testFoodSubChooseViewController
        
        allFood.append(subView.foodField.text!)
        
        self.data.allergy_syptoms_food = self.data.allergy_syptoms_food + subView.foodField.text! + " "
        
        foodList.reloadData()
    }
    
    
    

}
