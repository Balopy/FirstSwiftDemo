//
//  ImageViewController.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/25.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview();
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    lazy var imageView : UIImageView = {
       
        let imageView = UIImageView ()
        imageView.image =  #imageLiteral(resourceName: "发现_首页_推荐图书")
        self.view.addSubview(imageView)
        
        return imageView
    }()
    
}
