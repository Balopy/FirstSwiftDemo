//
//  AudioViewController.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/26.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit

class AudioViewController: UIViewController {
    
    var headerView : UIView = {
        let view = UIView ()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    var userHeader : UIImageView = {
        let header = UIImageView ()
        header.clipsToBounds = true
        header.contentMode = .scaleAspectFill
        return header
    }()
    
    var userName : UILabel = {
        let label = UILabel ()
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSubViewUI()
        configureUserInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension AudioViewController {
   
    @objc fileprivate func configureUserInfo () {
      
        self.headerView.backgroundColor = UIColor.init(red: 1, green: 0.3, blue: 0.1, alpha: 0.5)
        self.userName.text = "你是我的小小鸟"
        self.userHeader.image = #imageLiteral(resourceName: "发现_首页_推荐图书")
    }
}


extension AudioViewController {
    
    @objc fileprivate func setUpSubViewUI () {
        
        view.addSubview(headerView)
        headerView.addSubview(userHeader)
        headerView.addSubview(userName)
        
        headerView.snp.makeConstraints({ (make) in
            make.top.left.equalToSuperview().offset(BLConstMargin_15)
            make.right.bottom.equalToSuperview().offset(-BLConstMargin_15)
        })
        
        userHeader.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(BLConstMargin_15)
            make.size.equalTo(CGSize (width: 80, height: 80))
        }
        
        userName.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(userHeader.snp.bottom).offset(BLConstMargin_15)
        }
        
    }
}

