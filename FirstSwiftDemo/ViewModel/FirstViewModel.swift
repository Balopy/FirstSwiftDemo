//
//  FirstViewModel.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/25.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit
import Alamofire
class FirstViewModel: NSObject {
    
    fileprivate static var userTempDic = [String: String]()
    
    class func loadContentsNow(_ a: String, _ type: Int, _ page: Int = 1, _ maxTime: String = "", finishedBlock:@escaping((success :Bool, mTime: String, array : [BLContentModel])) ->()) {
        
        var parameter = [String: String]()
        parameter["a"] = a
        parameter["c"] = "data"
        parameter["page"] = "\(page)"
        parameter["type"] = "\(type)"
        parameter["maxtime"] = maxTime
        userTempDic = parameter
        
        let url = URL(string : "http://api.budejie.com/api/api_open.php")
        Alamofire.request(url!, method: .post, parameters: parameter).responseJSON { (response) in
            if userTempDic != parameter {
                return
            }
            
            switch response.result {
            case let .success(value):
                guard let dict = value as? [String: Any] else {
                    return
                }
                guard let datas = dict["list"] as? [[String: Any]] else {
                    return
                }
                
                var mmTime = ""
                if let lastTime = dict["info"] as? [String: Any] {
                    mmTime = (lastTime["maxtime"] as? String) ?? ""
                }
                
                var data = [BLContentModel]()
                for dic in datas {
                    data.append(BLContentModel(dict: dic))
                }
                finishedBlock((true, mmTime, data))
                
                
            case let .failure(error):
                finishedBlock((false, "", [BLContentModel]()))
                print("load content \(error)")
            }
        }
    }
}
