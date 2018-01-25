//
//  BLTableViewController.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/23.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit

fileprivate let BLCellID = "cellIDw"
class BLTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        setupTableView()
    }
}


extension BLTableViewController {
    
    func setupTableView() {
        
        tableView.register(UINib.init(nibName: "FirstTableViewCell", bundle: nil), forCellReuseIdentifier: BLCellID)
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.contentInset = UIEdgeInsets(top: kTopHeight + 24, left: 0, bottom: kTabBarHeight, right: 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        tableView.separatorStyle = .none
    }
}


// MARK: - Table view data source
extension BLTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BLCellID, for: indexPath)
        
        cell.contentView.backgroundColor = self.view.backgroundColor;
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension BLTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("------indexPath-----\(indexPath)")
        
    }
}
