//
//  FirstSwiftDemoController.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/23.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit

let kScreen_height = UIScreen.main.bounds.height
let kScreen_width = UIScreen.main.bounds.width
/*代替之前的49*/
let kTabBarHeight: CGFloat = (UIApplication.shared.statusBarFrame.size.height > 20.0 ? 83.0:49.0)
let kNavBarHeight:CGFloat = 44.0
let kStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height

/*代替之前的64*/
let kTopHeight = kStatusBarHeight + kNavBarHeight

let kMeCellID = "meCellId"


class FirstSwiftDemoController: UIViewController
{
    var currentBtn = UIButton()
    var isScroll = false
    
    var titles = ["全部内容","视频","声音","图片","段子"]
    lazy var bottomLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()  
    
    //底部大的容器存放子视图
    lazy var contentView: UIScrollView = {
        let scrollView = UIScrollView()
       
        
        let frame = self.view.bounds;
        scrollView.frame = frame;
        let size = CGSize(width: kScreen_width * CGFloat(self.titles.count), height: kScreen_height)
        scrollView.contentSize = size
        scrollView.bounces = false
        scrollView.isScrollEnabled = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        view.addSubview(scrollView)
        return scrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "中石油选课"
        self.view.backgroundColor = UIColor.white
        
        if #available(iOS 11.0, *) {
            contentView.contentInsetAdjustmentBehavior = .never
        }else{
            
            automaticallyAdjustsScrollViewInsets = false
        }
        
        setupSubViews()
        setupChildViewControllers()
        scrollViewDidScroll(contentView)

    }
}
// MARK: - 设置UI
extension FirstSwiftDemoController {
    fileprivate func setupSubViews() {
        
        let titleView = UIView (frame: CGRect (x: 0, y: kTopHeight, width: kScreen_width, height: 44))
        titleView.backgroundColor = UIColor.white
        view.addSubview(titleView)
        
        for i in 0..<titles.count {
            let button = UIButton (type: UIButtonType.custom)
            button.tag = i + 100
            button.setTitle(titles[i], for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitleColor(UIColor.red, for: .disabled)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            button.addTarget(self, action:  #selector(sectionDidSelectedForTag(_:)), for: .touchUpInside)
            
            let width = kScreen_width / CGFloat(titles.count)
            let height = titleView.frame.height-2
            button.frame = CGRect (x: CGFloat(i) * width, y: 0, width: width, height: height)
            titleView.addSubview(button)
            if i == 0 {
                self.bottomLine.frame = CGRect (x:0, y: 0, width: width*0.6, height: 2)
                self.bottomLine.center = CGPoint(x: button.frame.midX, y:button.frame.maxY + 1)
                titleView.addSubview(bottomLine)
                
                sectionDidSelectedForTag(button)
                
            }
        }
    }
}

extension FirstSwiftDemoController {
    
    @objc func sectionDidSelectedForTag(_ button:UIButton) {
        
        //        navigationController?.pushViewController(BLTableViewController(), animated: true)
        //        if !isScroll {
        contentView.contentOffset.x = kScreen_width*CGFloat(button.tag-100)
        //        }
        currentBtn.isEnabled = true
        currentBtn = button
        currentBtn.isEnabled = false
        
        UIView.animate(withDuration: 0.2) {
            
            self.bottomLine.center = CGPoint(x: button.frame.midX, y:button.frame.maxY + 1)
        }
        
        isScroll = false
    }
}

// MARK: - 数据源
extension FirstSwiftDemoController {
    @objc func setupChildViewControllers() {
        
        for i in 0..<titles.count {
            
            if Int(i)%2 == 0 {
                
                let  vc =  SecondTableViewController()
                vc.navtitle = titles[i]
                addChildViewController(vc)
            } else {
                
                let vc = BLTableViewController()
                addChildViewController(vc)
            }
        }
    }
}


extension FirstSwiftDemoController:UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        isScroll = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let index = scrollView.contentOffset.x / kScreen_width
        
        let vc = childViewControllers[Int(index)]
        
        switch Int(index) {
        case 0:
            vc.view.backgroundColor = UIColor.orange
            break
        case 1:
            vc.view.backgroundColor = UIColor.white
            break
        case 2:
            vc.view.backgroundColor = UIColor.green
            break
        case 3:
        vc.view.backgroundColor = UIColor.blue
            break
            
        default:
            vc.view.backgroundColor = UIColor.red
            break
        }
        vc.view.frame = CGRect(x: index * kScreen_width, y: bottomLine.frame.maxY, width: kScreen_width, height: contentView.contentSize.height)
        contentView.addSubview(vc.view)
    }
}


