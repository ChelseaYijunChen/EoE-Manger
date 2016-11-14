//
//  UserInfoViewController.swift
//  EoE_1
//
//  Created by SUN on 15/11/21.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController,UIPopoverPresentationControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate {

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
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var nameField: UITextField!
    
    
    @IBAction func showBDate(sender: UIButton) {
        self.performSegueWithIdentifier("showBDateView", sender: self)
    }
    
    
    func dismissKeyboard () {
        view.endEditing(true)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showBDateView" {
            let bDateView = segue.destinationViewController as UIViewController
            let bDatePopController = bDateView.popoverPresentationController
            if bDatePopController != nil {
                bDatePopController?.delegate = self
            }
        } else if segue.identifier == "showRaceList" {
            let raceListView = segue.destinationViewController as! raceChooseViewController
            let raceListPopController = raceListView.popoverPresentationController
            if raceListPopController != nil {
                raceListPopController?.delegate = self
            }
        } else if segue.identifier == "showMotherEducation" {
            let motherEduView = segue.destinationViewController as! motherEducationViewController
            let motherEduViewPopController = motherEduView.popoverPresentationController
            if motherEduViewPopController != nil {
                motherEduViewPopController?.delegate = self
            }
        } else if segue.identifier == "showFatherEducation" {
            let fatherEduView = segue.destinationViewController as! fatherEducationViewController
            let fatherEduViewPopController = fatherEduView.popoverPresentationController
            if fatherEduViewPopController != nil {
                fatherEduViewPopController?.delegate = self
            }
        }
        
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    
    @IBOutlet weak var ethnicityPicker: UIPickerView!
    
    @IBOutlet weak var sexPicker: UIPickerView!
    
    @IBOutlet weak var gradePicker: UIPickerView!
    
    @IBOutlet weak var LengthOfDPicker: UIPickerView!
    
    @IBOutlet weak var incomePicker: UIPickerView!
    
    
    
    let ethnicity = ["","No", "Yes"]
    let sex = ["","Male","Female"]
    let grade = ["","1st","2nd","3rd","4th","5th","6th","7th","8th","9th","10th","11th","12th"]
    let lengthOfD = ["","less than 1 year","1~5 years","more than 5 years"]
    let income = ["","Less than $10,000",
        "$15,000 to $24,999",
        "$30,000 to 34,9999",
        "$35,000 to $49,999",
        "$50,000 to $74,999",
        "$75,000 to $99,999",
        "$100,000 or more"
    ]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        
        if pickerView == ethnicityPicker {
            return 1
        } else if pickerView == sexPicker {
            return 1
        } else if pickerView == gradePicker {
            return 1
        } else if pickerView == LengthOfDPicker {
            return 1
        } else if pickerView == incomePicker {
            return 1
        }
        else {
            return 1
        }
        
        
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        if pickerView == ethnicityPicker {
            return ethnicity.count
        } else if pickerView == sexPicker {
            return sex.count
        } else if pickerView == gradePicker {
            return grade.count
        } else if pickerView == LengthOfDPicker {
            return lengthOfD.count
        } else if pickerView == incomePicker {
            return income.count
        }
        else {
            return 2
        }
        
        
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        
        if pickerView == ethnicityPicker {
            return ethnicity[row]
        } else if pickerView == sexPicker {
            return sex[row]
        } else if pickerView == gradePicker {
            return grade[row]
        } else if pickerView == LengthOfDPicker {
            return lengthOfD[row]
        } else if pickerView == incomePicker {
            return income[row]
        }
        else {
            return "error"
        }
        
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == ethnicityPicker {
            data.ethnicity = ethnicity[row]
        } else if pickerView == sexPicker {
            data.gender = sex[row]
        } else if pickerView == gradePicker {
            data.grade = grade[row]
        } else if pickerView == LengthOfDPicker {
            data.lengthOfDisease = lengthOfD[row]
        } else {
            data.familyIncome = income[row]
        }
        
    }
    
    
    
    
    
    //---------------------------labels---------------
    @IBOutlet weak var birthdayLabel: UILabel!
    
    @IBOutlet weak var raceLabel: UILabel!
    
    @IBOutlet weak var motherEduLabel: UILabel!
    
    @IBOutlet weak var fatherEduLabel: UILabel!
    
    
    //----------------------------save-----------------
    
    
    var data = UserInfo()
    
    @IBAction func unwindFromBirthDateView (unwindSegue: UIStoryboardSegue) {
        
        let dateView: bDatePickerViewController = unwindSegue.sourceViewController as! bDatePickerViewController
        
        let date = dateView.bDatePicker.date
        let formatterDate = NSDateFormatter()
        formatterDate.dateStyle = .LongStyle
        data.birthDate = formatterDate.stringFromDate(date)
        print(data.birthDate)
        birthdayLabel.text = data.birthDate
    }
    
    
    @IBAction func unwindFromRaceChoose (unwindSegue: UIStoryboardSegue) {
        let raceView: raceChooseViewController = unwindSegue.sourceViewController as! raceChooseViewController
        
        data.race = raceView.raceField.text!
        
        raceLabel.text = data.race
    }
    
    
    @IBAction func unwindFromMotherEdu (unwindSegue: UIStoryboardSegue) {
        let motherEduView: motherEducationViewController = unwindSegue.sourceViewController as! motherEducationViewController
        
        data.motherEducation = motherEduView.eduField.text!
        motherEduLabel.text = data.motherEducation
    }
    
    @IBAction func unwindFromFatherEduView (unwindSegue: UIStoryboardSegue) {
        let fatherEduView: fatherEducationViewController = unwindSegue.sourceViewController as! fatherEducationViewController
        
        data.fatherEducation = fatherEduView.eduField.text!
        fatherEduLabel.text = data.fatherEducation
        
        
    }
    
    func saveToTemp() {
        data.name = nameField.text!
        data.patientID = 1
    }
    
    
    @IBAction func save(sender: UIButton) {
        
        saveToTemp()
        
        let isInserted = DBManager.getInstance().addUserInfo(data)
        
        exDBManager.getInstance().addUser(data)
        
        if isInserted {
        let alertView = UIAlertController(title: "", message: "User information Saved!", preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alertView, animated: true, completion: nil)
        } else {
            let alertView = UIAlertController(title: "", message: "Saving failed!", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)

        }
        
    }
    

}
