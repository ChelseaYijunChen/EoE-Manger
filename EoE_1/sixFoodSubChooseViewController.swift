//
//  sixFoodSubChooseViewController.swift
//  EoE_1
//
//  Created by SUN on 15/12/1.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class sixFoodSubChooseViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

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
    
    
    
    
    @IBOutlet weak var foodPicker: UIPickerView!
    
    @IBOutlet weak var foodField: UITextField!
    
    let foodOptions = [
        "","milk","eggs","wheat","soy","nuts","seafood","other"
    ]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return foodOptions.count
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return foodOptions[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        foodField.text = foodOptions[row]
    }
    
    
    
}
