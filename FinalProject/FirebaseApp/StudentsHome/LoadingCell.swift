//
//  LoadingCell.swift
//  FirebaseApp
//
//  Created by 赵世晗 on 2019/5/23.
//  Copyright © 2019 Robert Canton. All rights reserved.
//

import UIKit

class LoadingCell: UITableViewCell {

    
    var spinner:UIActivityIndicatorView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spinner.topAnchor.constraint(equalTo: topAnchor, constant: 24.0).isActive = true
        spinner.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24.0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
