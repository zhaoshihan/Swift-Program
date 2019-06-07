//
//  ScoreTableViewController.swift
//  FinalProject
//
//  Created by 赵世晗 on 2019/6/7.
//  Copyright © 2019 Robert Canton. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.backgroundColor = UIColor(red: 131/255, green: 129/255, blue: 205, alpha: 0.5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func set(course:String, score:Double) {
        courseLabel.text = course
        scoreLabel.text = String(score)
    }
}

