//
//  HomeViewController.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/23.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit


let kMeCellID = "meCellId"


class HomeViewController: UIViewController
{
    var currentBtn = UIButton()
    var isScroll = false
    
    var titles = ["全部内容","视频","声音","图片"]//,"段子"
    
    lazy var titleView : UIView = {
        
        let tempView = UIView (frame: CGRect (x: 0, y: BLTop_Y, width: kScreen_width, height: 44))
        tempView.backgroundColor = UIColor.white
        view.addSubview(tempView)
        
        return tempView
    }()
    
    lazy var bottomLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()  
    
    lazy var scrollView : UIScrollView = {
        
        let scroll = UIScrollView()
       
        let frame = CGRect (x: 0, y: titleView.frame.maxY, width: kScreen_width, height: kScreen_height-titleView.frame.maxY)
        scroll.frame = frame
        
        let size = CGSize(width: kScreen_width * CGFloat(self.titles.count), height: frame.height)
        scroll.contentSize = size
        
        scroll.bounces = false
        scroll.isScrollEnabled = false
        scroll.isPagingEnabled = true
        scroll.delegate = self
        view.addSubview(scroll)

        return scroll
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "中石油选课"
        self.view.backgroundColor = UIColor.white
      
        //因为有延加载,要注意属性的调用顺序
        setupTitleViews()
        setupChildViewControllers()
        scrollViewDidScroll(self.scrollView)
//        setUpSomeOther()
    }
}

extension HomeViewController {
    @objc fileprivate func setUpSomeOther () {
        
        if #available(iOS 11.0, *) {
            self.scrollView.contentInsetAdjustmentBehavior = .never
        }else{

            automaticallyAdjustsScrollViewInsets = false
        }
    }
}

// MARK: - 设置UI 底部大的容器存放子视图
extension HomeViewController {
    
    fileprivate func setupTitleViews() {
        
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

extension HomeViewController {
    
    @objc func sectionDidSelectedForTag(_ button:UIButton) {
        
        //        navigationController?.pushViewController(VideoViewController(), animated: true)
        //        if !isScroll {
        self.scrollView.contentOffset.x = kScreen_width*CGFloat(button.tag-100)
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
extension HomeViewController {
    @objc func setupChildViewControllers() {
        
        for i in 0..<titles.count {
            
            switch i {
            case 0: do {
                let  vc =  AllContentViewController()
                addChildViewController(vc)
            }
                break
            case 1: do {
                let vc = VideoViewController()
                addChildViewController(vc)
            }
                break
            case 2: do {
                let vc = AudioViewController()
                addChildViewController(vc)
            }
                break
                
            case 3: do {
                
                let vc = ImageViewController()
                addChildViewController(vc)
            }
                break
            default:
                break
            }
        }
    }
}


extension HomeViewController:UIScrollViewDelegate {
    
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
        
        let frame : CGRect = CGRect (x: index * kScreen_width, y: 0, width: kScreen_width, height: scrollView.frame.height)
        vc.view.frame = frame
        scrollView.addSubview(vc.view)
    }
}


