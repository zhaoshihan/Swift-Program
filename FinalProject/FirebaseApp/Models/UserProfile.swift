//
//  User.swift
//  FirebaseApp
//
//  Created by 赵世晗 on 2019/6/1.
//  Copyright © 2019 Robert Canton. All rights reserved.
//

import Foundation

class UserProfile {
    var uid:String
    var username:String
    var photoURL:URL
    
    init(uid:String, username:String,photoURL:URL) {
        self.uid = uid
        self.username = username
        self.photoURL = photoURL
    }
}

