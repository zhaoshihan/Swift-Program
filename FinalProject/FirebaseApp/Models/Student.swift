//
//  Student.swift
//  FinalProject
//
//  Created by 赵世晗 on 2019/5/23.
//  Copyright © 2019 Robert Canton. All rights reserved.
//

import Foundation


class Student {
    var studentName:String
    var studentID:String
    var academy:String
    var IDCard:String
    var birthplace:String
    var telephone:String
    var email:String
    var grades:[String:Any]
    
    init(studentName:String, studentID:String, academy:String, IDCard:String, birthplace:String, telephone:String, email:String, grades:[String:Any]) {
        self.studentName = studentName
        self.studentID = studentID
        self.academy = academy
        self.IDCard = IDCard
        self.birthplace = birthplace
        self.telephone = telephone
        self.email = email
        self.grades = grades
    }
    
    static func parse(_ key:String, _ data:[String:Any]) -> Student? {
        if let grades = data["grades"] as? [String:Any],
            let studentName = data["studentName"] as? String,
            let studentID = data["studentID"] as? String,
            let academy = data["academy"] as? String,
            let IDCard = data["IDCard"] as? String,
            let birthplace = data["birthplace"] as? String,
            let telephone = data["telephone"] as? String,
            let email = data["email"] as? String{
            
            return Student(studentName: studentName, studentID: studentID, academy: academy, IDCard: IDCard, birthplace: birthplace, telephone: telephone, email: email, grades: grades)
            
        }
        
        return nil
    }
}
