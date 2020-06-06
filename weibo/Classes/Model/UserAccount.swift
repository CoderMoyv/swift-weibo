//
//  UserAccount.swift
//  weibo
//
//  Created by 陈先生 on 2020/6/6.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class UserAccount: NSObject {
    var access_token:String?
    var expiresDate:NSDate?
    var uid:String?
    var screen_name:String?
    var avatar_large:String?
    
    var expires_in:TimeInterval=0{
        didSet{
            expiresDate = NSDate(timeIntervalSinceNow: expires_in)
        }
    }
    
    init(dict:[String:AnyObject]) {
        super.init()
        self.setValuesForKeys(dict)
    }
    /*override func setValue(_ value: Any?, forKey key: String) {
     super.setValue(value, forKey: key)
     }*/
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    override var description: String{
        let keys = ["access_token","expires_in","expiresDate","uid","screen_name","avatar_large"]
        return dictionaryWithValues(forKeys: keys).description
    }
}
