//
//  StatusListViewModel.swift
//  小峰微博
//
//  Created by apple on 18/4/8.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit
class StatusListViewModel{
    lazy var statusList = [StatusViewModel]()
    func loadStatus(finished:@escaping (Bool) ->()){
        NetworkTools.sharedTools.loadStatus{
            (result,error)->() in
            if error != nil
            {
                print("出错了")
                finished(false)
                return
            }
            let result1 = result as? [String:AnyObject]
            guard let array = result1?["statuses"] as? [[String:AnyObject]] else
            {
                print("数据格式错误")
                finished(false)
                return
            }
            var dataList = [StatusViewModel]()
            for dict in array{
                dataList.append(StatusViewModel(status:Status(dict:dict)))
            }
            self.statusList = dataList + self.statusList
            finished(true)
        }
    }
}
