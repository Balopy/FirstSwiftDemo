//
//  BLCommonConst.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/25.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit

let kScreen_height = UIScreen.main.bounds.height
let kScreen_width = UIScreen.main.bounds.width


let BLCellTextMargin: CGFloat = 10
let BLCellHeaderHeight: CGFloat = 65
let BLCellFooterHeight: CGFloat = 54
let BLCellIamgeMaxH: CGFloat = 1500
let BLCellImageBreakHeight: CGFloat = 250
let BLStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
let BLiPhoneXHeight: CGFloat = 812
let BLNavBarHeight:CGFloat = 44.0

/*代替之前的49*/
let BLTabBarHeight: CGFloat = (UIApplication.shared.statusBarFrame.size.height > 20.0 ? 83.0:49.0)

/*代替之前的64*/
let BLTop_Y = BLStatusBarHeight + BLNavBarHeight

// 常用间距
let BLConstMargin_10: CGFloat = 10
let BLConstMargin_15: CGFloat = 15


enum ContentType: Int {
    case all = 1
    case picture = 10
    case word = 29
    case voice = 31
    case video = 41
}


