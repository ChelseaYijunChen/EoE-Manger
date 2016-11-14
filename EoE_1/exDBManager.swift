//
//  exDBManager.swift
//  EoE_1
//
//  Created by SUN on 15/12/3.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

let exinstance = exDBManager()

class exDBManager: NSObject {
    
    class func getInstance() -> exDBManager {
        return exinstance
    }
    
    
    func addUser(u: UserInfo) {
        print("Pressed")
        let url: NSURL = NSURL(string: "http://people.cs.clemson.edu/~yijun2/eoephp/addPatient3.php")!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
        
        request.HTTPMethod = "POST"
        let postString = "name=\(u.name)&birthDate=\(u.birthDate)&race=\(u.race)&ethnicity=\(u.ethnicity)&gender=\(u.gender)&grade=\(u.grade)&lengthOfDisease=\(u.lengthOfDisease)&motherEducation=\(u.motherEducation)&fatherEducation=\(u.fatherEducation)&familyIncome=\(u.familyIncome)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
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
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    
    
    func addfoodDiary(u: FoodDiary) {
        print("Pressed")
        let url: NSURL = NSURL(string: "http://people.cs.clemson.edu/~yijun2/eoephp/addFoodDiary2.php")!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
        
        request.HTTPMethod = "POST"
        let postString = "patientID=\(u.patientID)&time=\(u.time)&inputPerson=\(u.inputPerson)&image=\(u.image)&location=\(u.location)&meal=\(u.meal)&partner=\(u.partner)&feelBefore=\(u.feelBefore)&feelAfter=\(u.feelAfter)&worry=\(u.worry)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
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
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    
    
    func addPeess(u: PEESS) {
        print("Pressed")
        let url: NSURL = NSURL(string: "http://people.cs.clemson.edu/~yijun2/eoephp/addPeess.php")!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
        
        request.HTTPMethod = "POST"
        let postString = "patientID=\(u.patienID)&time=\(u.time)&q1f=\(u.q1f)&q1s=\(u.q1s)&q2f=\(u.q2f)&q2s=\(u.q2s)&q3f=\(u.q3f)&q3s=\(u.q3s)&q4f=\(u.q4f)&q4s=\(u.q4s)&q5f=\(u.q5f)&q5s=\(u.q5s)&q6f=\(u.q6f)&q6s=\(u.q6s)&q7f=\(u.q7f)&q7s=\(u.q7s)&q8f=\(u.q8f)&q8s=\(u.q8s)&q9f=\(u.q9f)&&q9s=\(u.q9s)&q10f=\(u.q10f)&q11f=\(u.q11f)"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
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
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    
    func addPedsQL(u: PedsQL) {
        print("Pressed")
        let url: NSURL = NSURL(string: "http://people.cs.clemson.edu/~yijun2/eoephp/addPedsQL.php")!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
        
        request.HTTPMethod = "POST"
        let postString = "patientID=\(u.patienID)&time=\(u.time)&s1q1=\(u.s1q1)&s1q2=\(u.s1q2)&s1q3=\(u.s1q3)&s1q4=\(u.s1q4)&s1q5=\(u.s1q5)&s1q6=\(u.s1q6)&s2q1=\(u.s2q1)&s2q2=\(u.s2q2)&s2q3=\(u.s2q3)&s2q4=\(u.s2q4)&s3q1=\(u.s3q1)&s3q2=\(u.s3q2)&s3q3=\(u.s3q3)&s3q4=\(u.s3q4)&s3q5=\(u.s3q5)&s4q1=\(u.s4q1)&s4q2=\(u.s4q2)&s4q3=\(u.s4q3)&s4q4=\(u.s4q4)&s4q5=\(u.s4q5)&s4q6=\(u.s4q6)&s5q1=\(u.s5q1)&s5q2=\(u.s5q2)&s5q3=\(u.s5q3)&s5q4=\(u.s5q4)&s5q5=\(u.s5q5)&s67=\(u.s67)&s6q1=\(u.s6q1)&s6q2=\(u.s6q2)&s6q3=\(u.s6q3)&s6q4=\(u.s6q4)&s7q1=\(u.s7q1)&s7q2=\(u.s7q2)&s7q3=\(u.s7q3)&s8=\(u.s8)&s8q1=\(u.s8q1)&s8q2=\(u.s8q2)"
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
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
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    
    func addUserSurvey(u: userSurvey) {
        print("Pressed")
        let url: NSURL = NSURL(string: "http://people.cs.clemson.edu/~yijun2/eoephp/addUserSurvey.php")!
        let request:NSMutableURLRequest = NSMutableURLRequest(URL:url)
        
        request.HTTPMethod = "POST"
        let postString = "patientID=\(u.patientID)&time=\(u.time)&steroid=\(u.steroid)&dietary=\(u.dietary) &foodElimination=\(u.foodElimination)&allergy_syptoms=\(u.allergy_syptoms)&allergy_syptoms_food=\(u.allergy_syptoms_food)&sixFood=\(u.sixFood)&sixFood_food=\(u.sixFood_food)&elementalDiet=\(u.elementalDiet)&exclElemental=\(u.exclElemental)&formula=\(u.formula)&foodTrial=\(u.foodTrial)&foodTrial_food=\(u.foodTrial_food)"
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
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
            print("responseString = \(responseString)")
        }
        task.resume()
    }

    
    
    
    
    

}
