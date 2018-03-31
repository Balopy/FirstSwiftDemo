//
//  BLUserModel.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/25.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit

class BLUserModel: NSObject {
   
    var username: String = ""
    var sex: String = ""
    var profile_image: String = ""
    
    init(dict: [String: Any]) {
        username = dict["username"] as? String ?? ""
        sex = dict["sex"] as? String ?? ""
        profile_image = dict["profile_image"] as? String ?? ""
    }
}
