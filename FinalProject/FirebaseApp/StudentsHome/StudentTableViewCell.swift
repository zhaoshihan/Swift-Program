//
//  StudentTableViewController.swift
//  FinalProject
//
//  Created by 赵世晗 on 2019/6/7.
//  Copyright © 2019 Robert Canton. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.backgroundColor = UIColor(red: 131/255, green: 129/255, blue: 205, alpha: 0.5)

        profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        profileImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    weak var student:Student?
    
    func set(student:Student) {
        self.student = student
        
        self.profileImageView.image = nil
//        ImageService.getImage(withURL: post.author.photoURL) { image, url in
//            guard let _post = self.post else { return }
//            if _post.author.photoURL.absoluteString == url.absoluteString {
//                self.profileImageView.image = image
//            } else {
//                print("Not the right image")
//            }
//
//        }
        
        usernameLabel.text = student.studentName
        subtitleLabel.text = student.academy
        let gradesString = (student.grades.compactMap({ (key, value) -> String in
            return "\(key) = \(value)"
        }) as Array).joined(separator: "\n")
        postTextLabel.text = gradesString
    }
    
    
}
