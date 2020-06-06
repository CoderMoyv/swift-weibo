//
//  NetworkTools.swift
//  weibo
//
//  Created by 陈先生 on 2020/6/5.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit
import AFNetworking

class NetworkTools: AFHTTPSessionManager {
    public let appKey = "783959959"
    public let appSecret = "173e889ea6f8b3e33137fcc6971157df"
    public let redirectUrl = "http://www.baidu.com"
    
     typealias HMRequsetCallBack = (AnyObject?, Error?) -> ()
    
    var OAuthURL:NSURL {
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(appKey)&redirect_uri=\(redirectUrl)&response_type=code"
        return NSURL(string: urlString)!
    }
    
    static let sharedTools:NetworkTools={
        let tools = NetworkTools(baseURL: nil)
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
          tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return tools
    }()
}
extension NetworkTools{
//        func request(URLString:String,parameters:[String:AnyObject]?){
//            self.get(URLString, parameters: parameters, progress: nil, success: {(_,result) in print(result!)}) { (_, error) in
//                print(error)
//            }
//        }
    func request(method:HMRequestMethod,URLString:String,parameters:[String:AnyObject]?,finished:@escaping HMRequsetCallBack){
        
        let success = { (task:URLSessionDataTask?, result:Any?)->Void in
            finished(result as AnyObject?,nil)
        }
        let failure = { (task:URLSessionDataTask?, error:Error)->Void in
            finished(nil,error)
        }
        if method == .GET{
            self.get(URLString, parameters: parameters, progress: nil, success:success,failure:failure)
        }
        if method == .POST{
            self.post(URLString, parameters: parameters, progress: nil, success:success,failure:failure)
        }
    }
    
    func loadAccessToken(code:String,finished:@escaping HMRequsetCallBack){
        let urlString = "https://api.weibo.com/oauth2/access_token"
        let params = ["client_id" : appKey , "client_secret" : appSecret , "client_secret" : "authorization_code" , "code" : code , "redirect_uri" : redirectUrl]
        request(method: .POST, URLString: urlString, parameters: params as [String : AnyObject]?, finished: finished)
    }
    func loadUserInfo(uid:String,accessToken:String,finished:@escaping HMRequsetCallBack){
        let urlString = "https://api.weibo.com/2/users/show.json"
        let params = ["uid":uid,"access_token":accessToken]
        request(method: .GET, URLString: urlString, parameters: params as [String : AnyObject]?, finished: finished)
    }
    
}
enum HMRequestMethod:String{
    case GET="GET"
    case POST="POST"
}
