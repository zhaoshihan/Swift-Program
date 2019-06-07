//
//  ScoreTableViewCell.swift
//  FinalWork
//
//  Created by alu on 2019/5/25.
//  Copyright © 2019年 alu. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {

    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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

