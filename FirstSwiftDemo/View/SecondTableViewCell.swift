//
//  SecondTableViewCell.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/26.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class SecondTableViewCell: UITableViewCell {
    
   lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.black
        return label
    }()

   lazy var detailLab : UILabel = {

        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.black
        return label
    }()

   lazy var imgView : UIImageView! = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
      
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
      
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLab)
        contentView.addSubview(imgView)
    }
    
    override func layoutSubviews() {
      
        self.imgView.snp.makeConstraints({ (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(100)
        })
        self.titleLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(self.imgView.snp.right).offset(15)
            make.top.equalTo(self.imgView)
            make.right.equalToSuperview().offset(-15)
        })
        
        self.detailLab.snp.makeConstraints({ (make) in
          
            make.bottom.equalTo(self.imgView.snp.bottom)
            make.left.right.equalTo(self.titleLabel)
        })
    }
    
    

   public func configureData() {
        self.titleLabel.text = "你的是我的小小秘"
        self.detailLab.text = "我是你的大大秘"
        self.imgView.image = #imageLiteral(resourceName: "发现_首页_推荐图书")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


extension SecondTableViewCell {
   
    @objc fileprivate func setUpSubViewUI() {
    
    
    }
}
