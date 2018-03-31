//
//  VideoViewController.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/23.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit

fileprivate let BLCellID = "cellIDw"
class VideoViewController: UITableViewController {
    
    var abcd: String {
        return parent.self!.isKind(of: ImageViewController.self) ? "newlist":"list"
    }
    var contents = [BLContentModel]()
    var page: Int = 0
    var maxTime: String = ""
    var type: ContentType = .all
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        setupTableView()
        loadContentData()
    }
}



extension VideoViewController {
    
    func setupTableView() {
        
        tableView.register(UINib.init(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: BLCellID)
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.scrollIndicatorInsets = tableView.contentInset
        tableView.separatorStyle = .none
    }
}


extension VideoViewController {
    fileprivate func loadContentData() {
        page += 1
        FirstViewModel.loadContentsNow(abcd, type.rawValue, page, maxTime) { (isSuccess, maxTime, dataArray) in
            if isSuccess {
                self.maxTime = maxTime
                self.contents += dataArray
                self.tableView .reloadData()
            } else {
                self.page -= 1
            }
        }
    }
}

// MARK: - Table view data source
extension VideoViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 20
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BLCellID, for: indexPath)
        
        cell.contentView.backgroundColor = UIColor.lightGray;
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension VideoViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("------indexPath-----\(indexPath)")
        
    }
}
