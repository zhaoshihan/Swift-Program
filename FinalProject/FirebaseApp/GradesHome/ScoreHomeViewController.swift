//
//  ScoreHomeViewController.swift
//  FinalProject
//
//  Created by 赵世晗 on 2019/6/7.
//  Copyright © 2019 Robert Canton. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ScoreHomeViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    private static let scoreCellIdentifier = "ScoreTableViewCell"
    
    private static let ScoreEntityName = "Score"
    private static let courseKey = "course"
    private static let snameKey = "sname"
    private static let scoreKey = "score"
    
    var scoreDetail:[String:Double]  = ["Hahaha": 100]
    var courses:[String] = ["Hahaha"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        scoreDetail.removeAll()
        courses.removeAll()
        
        let studentName = nameTextField.text!
        
        let searchRef = Database.database().reference().child("students/\(studentName)/grades")
        
        searchRef.observe(.value, with: { snapshot in

            let dict = snapshot.value as? [String:Any]
            for(course, score) in dict!{
                self.scoreDetail[course] = (score as? NSNumber)?.doubleValue
                self.courses.append(course)
            }
            
            self.tableView.reloadData()
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        let cellNib = UINib(nibName: "ScoreTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "scoreCell")
        
        tableView.backgroundColor = UIColor(white: 0.1, alpha:0)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 67
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        // view.addSubview(tableView)
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.scoreDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell", for: indexPath) as! ScoreTableViewCell
//        cell.courseLabel.text = courses[indexPath.row]
//        cell.scoreLabel.text = String(describing: scoreDetail[courses[indexPath.row]]!)
        let course:String = courses[indexPath.row]
        let score:Double = scoreDetail[course]!
        cell.set(course: course, score: score)
        return cell
    }
    
}
