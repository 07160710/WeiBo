//
//  Status.swift
//  小峰微博
//
//  Created by apple on 17/11/30.
//  Copyright © 2017年 Student. All rights reserved.
//

import UIKit

class Status: NSObject {
    var id:Int = 0
    var text:String?
    var created_at:String?
    var source:String?
    var user:User?
    init(dict:[String:AnyObject]){
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    override var description: String{
        let keys=["id","text","created_at","source","user"]
        return dictionaryWithValues(forKeys: keys).description
    }
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "user"
        {
            if let dict = value as? [String:AnyObject]
            {
                user=User(dict:dict)
            }
            return
        }
        super.setValue(value, forKey: key)
    }

}
