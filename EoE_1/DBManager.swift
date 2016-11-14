//
//  DBManager.swift
//  EoE_1
//
//  Created by SUN on 15/12/3.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

let instance = DBManager()

class DBManager: NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> DBManager {
        if instance.database == nil {
            instance.database = FMDatabase(path: Util.getPath("EoE_2.sqlite"))
        }
        return instance
    }
    
    
    func addUserInfo(u: UserInfo) -> Bool{
        instance.database!.open()
        var isInserted = false
        isInserted = instance.database!.executeUpdate("INSERT INTO userInfo (patientID, name, birthDate, race, ethnicity, gender, grade, lengthOfDisease, motherEducation, fatherEducation, familyIncome) VALUES(?,?,?,?,?,?,?,?,?,?,?)", withArgumentsInArray: [u.patientID, u.name, u.birthDate, u.race, u.ethnicity, u.gender, u.grade, u.lengthOfDisease, u.motherEducation, u.fatherEducation, u.familyIncome])
        
        instance.database!.close()
        return isInserted
    }
    
    func addFoodDiary(f: FoodDiary) -> Bool {
        instance.database!.open()
        var isInserted = false
        
        isInserted = instance.database!.executeUpdate("INSERT INTO foodDiary (patientID, time, inputPerson, image, location, meal, partner, feelBefore, feelAfter, worry) VALUES(?,?,?,?,?,?,?,?,?,?)", withArgumentsInArray: [f.patientID, f.time, f.inputPerson, f.image, f.location, f.meal, f.partner, f.feelBefore, f.feelAfter, f.worry])
        
        instance.database!.close()
        return isInserted
    }
    
    
    func addPedsQL(p: PedsQL) -> Bool {
        instance.database!.open()
        var isInserted = false
        
        isInserted = instance.database!.executeUpdate("INSERT INTO PedsQL (patientID, time, s1q1, s1q2, s1q3, s1q4, s1q5, s1q6, s2q1, s2q2, s2q3, s2q4, s3q1, s3q2, s3q3, s3q4, s3q5, s4q1, s4q2, s4q3, s4q4, s4q5, s4q6, s5q1, s5q2, s5q3, s5q4, s5q5, s67, s6q1, s6q2, s6q3, s6q4, s7q1, s7q2, s7q3, s8, s8q1, s8q2) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", withArgumentsInArray: [p.patienID, p.time, p.s1q1, p.s1q2, p.s1q3, p.s1q4, p.s1q5, p.s1q6, p.s2q1, p.s2q2, p.s2q3, p.s2q4, p.s3q1, p.s3q2, p.s3q3, p.s3q4, p.s3q5, p.s4q1, p.s4q2, p.s4q3, p.s4q4, p.s4q5, p.s4q6, p.s5q1, p.s5q2, p.s5q3, p.s5q4, p.s5q5, p.s67, p.s6q1, p.s6q2, p.s6q3, p.s6q4, p.s7q1, p.s7q2, p.s7q3, p.s8, p.s8q1, p.s8q2])
        
        instance.database!.close()
        return isInserted
    }
    
    
    func addPEESS(e: PEESS) -> Bool {
        instance.database!.open()
        var isInserted = false
        
        isInserted = instance.database!.executeUpdate("INSERT INTO peess (patientID, time, q1f, q1s, q2f, q2s, q3f, q3s, q4f, q4s, q5f, q5s, q6f, q6s, q7f, q7s, q8f, q8s, q9f, q9s, q10f, q11f) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", withArgumentsInArray: [e.patienID, e.time, e.q1f, e.q1s, e.q2f, e.q2s, e.q3f, e.q3s, e.q4f, e.q4s, e.q5f, e.q5s, e.q6f, e.q6s, e.q7f, e.q7s, e.q8f, e.q8s, e.q9f, e.q9s, e.q10f, e.q11f])
        
        instance.database!.close()
        return isInserted
    }
    
    func addUserSurvey(v: userSurvey) -> Bool {
        instance.database!.open()
        var isInserted = false
        
        isInserted = instance.database!.executeUpdate("INSERT INTO userSurvey (patientID, time, steroid, dietary, foodElimination, allergy_syptoms, allergy_syptoms_food, sixFood, sixFood_food, elementalDiet, exclElemental, formula, foodTrial, foodTrial_food) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)", withArgumentsInArray: [v.patientID, v.time, v.steroid, v.dietary, v.foodElimination, v.allergy_syptoms, v.allergy_syptoms_food, v.sixFood, v.sixFood_food, v.elementalDiet, v.exclElemental, v.formula, v.foodTrial, v.foodTrial_food])
        
        instance.database!.close()
        return isInserted
    }
    
    
    func checkUserExist(key: Int) -> Bool {
        instance.database!.open()
        
        let result: FMResultSet! = instance.database!.executeQuery("SELECT * FROM userInfo WHERE patientID=?", withArgumentsInArray: [key])
        
        if result == nil {
            return false
        } else {
            return true
        }
    }
    
    
    
    

}
