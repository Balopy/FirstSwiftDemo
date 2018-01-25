//
//  SecondTableViewController.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/23.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit

fileprivate let BLCellID = "cellIDw"

class SecondTableViewController: UITableViewController {
    
    var navtitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        setupTableView()
    }
}


extension SecondTableViewController {
    
    func setupTableView() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: BLCellID)
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.contentInset = UIEdgeInsets(top: kTopHeight + 24, left: 0, bottom: kTabBarHeight, right: 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        tableView.separatorStyle = .none
    }
}


// MARK: - Table view data source
extension SecondTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BLCellID, for: indexPath)
        
        cell.textLabel?.text = "hhehehehehe"
        cell.detailTextLabel?.text = "dfasfasfas"
        cell.contentView.backgroundColor = self.view.backgroundColor;
        return cell
    }
}

extension SecondTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("------indexPath-----\(indexPath)")
        
    }
}


