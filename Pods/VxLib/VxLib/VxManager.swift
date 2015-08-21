//
//  VxManager.swift
//  VxLib
//
//  Created by Pidhi on 21/08/15.
//  Copyright © 2015 verax. All rights reserved.
//
public class VxManager{
    
    var name:String!
    var message:String!
    
    public init(name:String, message:String){
        
        self.name = name
        self.message = message
        
    }
    
    public func printMessage(){
        
        print("\(name) says \(message)")
    }
}