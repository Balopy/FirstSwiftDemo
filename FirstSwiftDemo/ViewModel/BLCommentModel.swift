//
//  BLCommentModel.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/25.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit

class BLCommentModel: NSObject {

    var ID: String = ""
    var voicetime: Int = 0
    var voiceurl: String = ""
    var content: String = ""
    var like_count = 0
    var user: BLUserModel!
    
    init(dict: [String: Any]) {
        ID = dict["id"] as? String ?? ""
        voicetime = dict["voicetime"] as? Int ?? 0
        content = dict["content"] as? String ?? ""
        voiceurl = dict["voiceurl"] as? String ?? ""
        like_count = dict["like_count"] as? Int ?? 0
        user = BLUserModel(dict: dict["user"] as! [String : Any])
    }
    
    
}
