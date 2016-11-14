//
//  ViewController.swift
//  EoE_1
//
//  Created by SUN on 15/11/13.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource,UIPopoverPresentationControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        whereLabel.numberOfLines = 0
        worryLabel.numberOfLines = 0
        
        
        
        let localNotification:UILocalNotification = UILocalNotification()
        
        let dateComp: NSDateComponents = NSDateComponents()
        dateComp.year = 2015
        dateComp.month = 12
        dateComp.day = 6
        dateComp.hour = 14
        dateComp.minute = 23
        dateComp.timeZone = NSTimeZone.systemTimeZone()
        let notiCalendar: NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let notiDate: NSDate = notiCalendar.dateFromComponents(dateComp)!
        
        localNotification.alertAction = "Time for food diary!"
        localNotification.alertBody = "Please record your meal!"
        localNotification.fireDate = notiDate
        localNotification.repeatInterval = NSCalendarUnit.Minute
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
    }
    
    var alreadyChoseInput = false
    
    override func viewDidAppear(animated: Bool) {
        if alreadyChoseInput == false {
            showInputChoice()
            alreadyChoseInput = true
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard () {
        view.endEditing(true)
    }
    
    var data = FoodDiary()
    
    //--------------------------------------food image----------------------------------------
    
    @IBOutlet weak var foodImage: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    @IBAction func takePicture(sender: UIButton) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        foodImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
    }
    
    
    func uploadImage() {
        
        let myUrl = NSURL(string: "http://people.cs.clemson.edu/~yijun2/uploadImage.php")
        
        let request = NSMutableURLRequest(URL: myUrl!)
        
        request.HTTPMethod = "POST"
        
        let param = ["userID" : "9"]
        
        let boundary = generateBoundaryString()
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-type")
        
        let imageData = UIImageJPEGRepresentation(foodImage.image!, 1)
        
        if imageData == nil {return}
        
        request.HTTPBody = createBodyWithParameters(param, filePathKey: "file", imageDataKey: imageData!, boundary: boundary)
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            data,response,error in
            //print(response)
            print("-----------")
            if error != nil
            {
                print("error=\(error)")
                return
            }
            //print("response = \(response)")
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString!)")
        }
        
        
        task.resume()
        
    }
    
    
    func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData {
        let body = NSMutableData();
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString("--\(boundary)\r\n")
                body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString("\(value)\r\n")
            }
        }
        
        let filename = getTime()+".jpg"
        
        data.image = "http://people.cs.clemson.edu/~yijun2/EoEImage/"+filename
        
        let mimetype = "image/jpg"
        
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
        body.appendString("Content-Type: \(mimetype)\r\n\r\n")
        body.appendData(imageDataKey)
        body.appendString("\r\n")
        
        
        
        body.appendString("--\(boundary)--\r\n")
        
        return body
    }
    
    
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().UUIDString)"
    }
    
    
    
    
    
    
//    func saveUIImage(image: UIImage) -> String? {
//        
//        
//        let docsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
//        
//        let imageDirPath = NSURL(fileURLWithPath: docsPath).URLByAppendingPathComponent("SwiftDataImages")
//        
//        if !NSFileManager.defaultManager().fileExistsAtPath(imageDirPath.path!) {
//            
//            do {
//                try NSFileManager.defaultManager().createDirectoryAtURL(imageDirPath, withIntermediateDirectories: false, attributes: nil)
//            } catch let error as NSError {
//                print("\(error.localizedDescription)")
//            }
//            
//        }
//        let imageID = NSUUID().UUIDString
//        let imagePath = imageDirPath.URLByAppendingPathComponent(imageID)
//        let imageAsData = UIImagePNGRepresentation(image)
//        if !imageAsData!.writeToFile(imagePath.path!, atomically: true) {
//            print("Error saving image")
//            return nil
//        }
//        print(imagePath.path!)
//        
//        return imagePath.path!
//    }
    
    
    
    
    //---------------------------------------add partner--------------------------------------
    @IBAction func addPartner(sender: UIButton) {
        
        self.performSegueWithIdentifier("showAddPartnerName", sender: self)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showAddPartnerName" {
            let addPartnerView = segue.destinationViewController as UIViewController
            let addPartnerPopController = addPartnerView.popoverPresentationController
            if addPartnerPopController != nil {
                addPartnerPopController?.delegate = self
            }
        }
        
    }
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    
    
    @IBOutlet weak var partnerList: UITableView!
    var allPartner = [String]()
    
    @IBAction func unwindFromAddPartner (unwindSegue: UIStoryboardSegue) {
        let addPartnerView: addPartnerViewController = unwindSegue.sourceViewController as! addPartnerViewController
        allPartner.append(addPartnerView.nameField.text!)
        partnerList.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPartner.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = partnerList.dequeueReusableCellWithIdentifier("PartnerNameCell")
        let partner = allPartner[indexPath.row]
        cell?.textLabel?.text = partner
        return cell!
    }
    
    
   //-------------------------labels&fields&segmentalControl--------
    
    
    @IBOutlet weak var worryLabel: UILabel!
    
    @IBOutlet weak var whereLabel: UILabel!
    
    @IBOutlet weak var whereField: UITextField!
    
    @IBOutlet weak var feelBeforeControl: UISegmentedControl!
    
    @IBOutlet weak var feelAfterControl: UISegmentedControl!
    
    @IBOutlet weak var worryControl: UISegmentedControl!
    //-----------------------pickers--------------------------------
    
    
    @IBOutlet weak var locationPicker: UIPickerView!
    
    @IBOutlet weak var mealPicker: UIPickerView!
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    let placeList = ["Where?","Home","School","Restaurant","Friend's House","Family Member's House","other"]
    let mealList = ["Which meal?","Breakfast","Lunch","Dinner","Snack"]
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            return placeList.count
        } else {
            return mealList.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return placeList[row]
        } else {
            return mealList[row]
        }
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == locationPicker {
            data.location = placeList[row]
            
        } else if pickerView == mealPicker {
            data.meal = mealList[row]
            
        }
        
    }
    
    
    
    
    
    //--------------------------------------end pickers-------------------
    
    @IBAction func saveFoodDiary(sender: UIButton) {
        if ((foodImage.image) != nil) {
            uploadImage()
        }
        saveToTemp()
        displayTemp(data)
        let isInserted = DBManager.getInstance().addFoodDiary(data)
        
        exDBManager.getInstance().addfoodDiary(data)
        
        if isInserted {
        let alertView = UIAlertController(title: "", message: "Food Diary Saved!", preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alertView, animated: true, completion: nil)
        } else {
            let alertView = UIAlertController(title: "", message: "Save Failed!", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }
        
        
    }
    
 //------------------------end save-------------------------
    

    func showInputChoice() {
        let alertView = UIAlertController(title: "", message: "Who is inputting data?", preferredStyle: .Alert)
        
        let childAction = UIAlertAction(title: "Child", style: .Default, handler: {
            Void in
                self.data.inputPerson = "Child"
                print(self.data.inputPerson)
        })
        alertView.addAction(childAction)
        
        let parentAction = UIAlertAction(title: "Parent", style: .Default, handler: {
            Void in
                self.data.inputPerson = "Parent"
                print(self.data.inputPerson)
        })
        alertView.addAction(parentAction)
        
        let adultAction = UIAlertAction(title: "Neither, I am an adult patient", style: .Default, handler: {
            Void in
                self.data.inputPerson = "Adult_patient"
        })
        alertView.addAction(adultAction)
        
        presentViewController(alertView, animated: true, completion: nil)
        
        
    }
    
    
    func getTime () -> String {
        var time: String = String()
        
        let date = NSDate()
        
        let formatterTime = NSDateFormatter()
        formatterTime.timeStyle = .ShortStyle
        let time1 = formatterTime.stringFromDate(date)
        
        let formatterDate = NSDateFormatter()
        formatterDate.dateStyle = .LongStyle
        let time2 = formatterDate.stringFromDate(date)
        
        time = time2 + " " + time1
        return time
    }
    
    func saveToTemp() {
        data.patientID = 1
        data.time = getTime()
        if data.image == "" {
            data.image = "image"
            }
        
        if (data.location == "other" && whereField.text != "") {
            data.location = whereField.text!
        }
        
        for (var i = 0; i < allPartner.count; i++) {
            data.partner = data.partner + allPartner[i] + " "
        }
        
        data.feelBefore = feelBeforeControl.selectedSegmentIndex
        data.feelAfter = feelAfterControl.selectedSegmentIndex
        data.worry = worryControl.selectedSegmentIndex
    }
    
    
    func displayTemp(temp: FoodDiary) {
        print(temp.patientID)
        print(temp.time)
        print(temp.inputPerson)
        print(temp.image)
        print(temp.location)
        print(temp.meal)
        print(temp.partner)
        print(temp.feelBefore)
        print(temp.feelAfter)
        print(temp.worry)
    }
    
    
    


}


extension NSMutableData {
    
    func appendString(str : String) {
        let data = str.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        appendData(data!)
    }
    
}



