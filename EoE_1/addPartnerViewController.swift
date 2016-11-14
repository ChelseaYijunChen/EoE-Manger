//
//  addPartnerViewController.swift
//  EoE_1
//
//  Created by SUN on 15/11/15.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class addPartnerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preferredContentSize = CGSizeMake(300, 250)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var partnerPicker: UIPickerView!
    
    
    let partnerList = ["","Family","Friends","Other"]
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return partnerList.count
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return partnerList[row]
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameField.text = partnerList[row]
    }
    
    

}
