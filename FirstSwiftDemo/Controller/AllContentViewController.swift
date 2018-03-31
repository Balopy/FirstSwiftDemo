//
//  AllContentViewController.swift
//  FirstSwiftDemo
//
//  Created by 王春龙 on 2018/1/23.
//  Copyright © 2018年 Balopy. All rights reserved.
//

import UIKit

fileprivate let BLCellID = "cellIDw"

class AllContentViewController: UITableViewController {
    
    var navtitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        setupTableView()
    }
}


extension AllContentViewController {
    
    func setupTableView() {
        
        tableView.register(SecondTableViewCell.self, forCellReuseIdentifier: BLCellID)
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.scrollIndicatorInsets = tableView.contentInset
        tableView.separatorStyle = .none
    }
}


// MARK: - Table view data source
extension AllContentViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell : SecondTableViewCell = tableView.dequeueReusableCell(withIdentifier: BLCellID, for: indexPath) as! SecondTableViewCell
        
        cell.configureData()
        
       return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
}

extension AllContentViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("------indexPath-----\(indexPath)")
        
    }
}


