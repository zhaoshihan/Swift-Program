//
//  PostTableViewCell.swift
//  FirebaseApp
//
//  Created by Robert Canton on 2018-02-08.
//  Copyright © 2018 Robert Canton. All rights reserved.
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
        postTextLabel.text = student.telephone
    }
    
    
}
