//
//  User.swift
//  小峰微博
//
//  Created by apple on 18/4/8.
//  Copyright © 2018年 Student. All rights reserved.
//

import UIKit
class User:NSObject{
    var id:Int = 0
    var screen_name:String?
    var profile_image_url:String?
    var verified_type:Int = 0
    var mbrank:Int = 0
    init(dict:[String:AnyObject]){
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    override var description: String{
        let keys=["id","screen_name","profile_image_url","verified_type","mbrank"]
        return dictionaryWithValues(forKeys: keys).description
    }
}
