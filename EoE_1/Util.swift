//
//  Util.swift
//  EoE_1
//
//  Created by SUN on 15/12/3.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class Util: NSObject {
    
    class func getPath(fileName: String) -> String {
        
        let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)[0]
        
        let fileURL = documentsURL.URLByAppendingPathComponent(fileName)
        
        return fileURL.path!
        
    }
    
    class func copyFile(fileName: String){
        
        let dbPath: String = getPath(fileName)
        print(dbPath)
        let fileManager = NSFileManager.defaultManager()
        
        if !fileManager.fileExistsAtPath(dbPath) {
            let documentsURL = NSBundle.mainBundle().resourceURL
            let fromPath = documentsURL!.URLByAppendingPathComponent(fileName as String)
            
            var error: NSError?
            do {
                try fileManager.copyItemAtPath(fromPath.path!, toPath: dbPath)
            } catch let error1 as NSError {
                error = error1
            }
            
            let alert: UIAlertView = UIAlertView()
            if error != nil {
                alert.title = "Error"
                alert.message = error?.localizedDescription
            } else {
                //alert.title = "Copy successfully"
                alert.message = "Your database is ready to use"
            }
            
            alert.delegate = self
            alert.addButtonWithTitle("OK")
            alert.show()
            
        }
        
    }
}
