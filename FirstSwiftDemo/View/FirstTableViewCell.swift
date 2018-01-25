//
//  FirstTableViewCell.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/24.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var headerIcon: UIImageView!
    
    @IBOutlet weak var titleLabe: UILabel!
    
    @IBOutlet weak var teacherName: UILabel!
    
    @IBOutlet weak var createTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.createTime.text = "2018-10-11"
   //我在这加了一句
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
