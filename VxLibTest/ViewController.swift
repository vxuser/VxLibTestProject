//
//  ViewController.swift
//  VxLibTest
//
//  Created by Pidhi on 21/08/15.
//  Copyright © 2015 verax. All rights reserved.
//

import UIKit
import VxLib
import CoreData
import Alamofire
import CoreDataKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.testVxLibManager()
        self.testAlamofire()
        self.testCoreDataKit()
        
        
        
            }

    
    func testVxLibManager(){
        
        let message = VxManager(name: "Savvy", message: "Hello")
        
        message.printMessage()
        
    }
    
    func testCoreDataKit(){
    
        if let persistentStoreCoordinator = NSPersistentStoreCoordinator(automigrating: true) {
            CDK.sharedStack = CoreDataStack(persistentStoreCoordinator: persistentStoreCoordinator)
        }

      
    }
    
    
    func testAlamofire(){
    
        let jsonData = [
            
            "username":"hi",
            
            "password":"bye"
            
        ]
        
        print("jsonData \(jsonData)")
        
        let request = Alamofire.request(
            
            .POST,
            
            "http://localhost:8080/itrade/rest/auth/login",
            
            parameters: jsonData,
            
            encoding: .JSON
            
        )
        
        request.responseJSON { _, _, data in
            // existing code
            if(data.value != nil){
                let json = data.value! as! NSDictionary
                
                let response:NSDictionary = json.valueForKey("response") as! NSDictionary
                
                
                if(response.valueForKey("activated") as! Int == 1){
                    print("Logged In")
                    
                }
                
            }
            
        }
        

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

