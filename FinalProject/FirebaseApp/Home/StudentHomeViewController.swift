//
//  HomeViewController.swift
//  FirebaseApp
//
//  Created by Robert Canton on 2018-02-02.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class StudentHomeViewController:UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView:UITableView!
    
//    var students = [Student]()
    var students = [
        Student(studentName: "zhangsan", studentID: "101", academy: "Computer", IDCard: "1234567890", birthplace: "Hubei", telephone: "12345678", email: "zhangsan@gmail.com", grades: ["Math":"100"]),
        Student(studentName: "lisi", studentID: "102", academy: "Literature", IDCard: "1111111111", birthplace: "Hunan", telephone: "87654321", email: "lisi@126.com", grades: [:])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds, style: .plain)
        
        let cellNib = UINib(nibName: "StudentTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "studentCell")
        tableView.backgroundColor = UIColor(white: 0.90,alpha:1.0)
        view.addSubview(tableView)
        
        var layoutGuide:UILayoutGuide!
        
        if #available(iOS 11.0, *) {
            layoutGuide = view.safeAreaLayoutGuide
        } else {
            // Fallback on earlier versions
            layoutGuide = view.layoutMarginsGuide
        }
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
//        observePosts()
        
    }
    
    func observePosts() {
        let postsRef = Database.database().reference().child("students")
        
        postsRef.observe(.value, with: { snapshot in
            
            var tempPosts = [Student]()
            
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any],
                    
                    let studentName = dict["studentName"] as? String,
                    let studentID = dict["studentID"] as? String,
                    let academy = dict["academy"] as? String,
                    let IDCard = dict["IDCard"] as? String,
                    let birthplace = dict["birthplace"] as? String,
                    let telephone = dict["telephone"] as? String,
                    let email = dict["email"] as? String,
                    let grades = dict["grades"] as? [String:Any]{
                    
                    let student = Student(studentName: studentName, studentID: studentID, academy: academy, IDCard: IDCard, birthplace: birthplace, telephone: telephone, email: email, grades: grades)
                    tempPosts.append(student)
                }
            }
            
            self.students = tempPosts
            self.tableView.reloadData()
            
        })
    }
    
    @IBAction func handleLogout(_ sender:Any) {
        try! Auth.auth().signOut()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! StudentTableViewCell
        cell.set(student: students[indexPath.row])
        return cell
    }
}
