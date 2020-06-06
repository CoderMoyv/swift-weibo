//
//  OAuthViewController.swift
//  weibo
//
//  Created by 陈先生 on 2020/6/5.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController {
public lazy var webview = UIWebView()
    override func viewDidLoad() {
        super.viewDidLoad()
        //view = webview
        self.webview.loadRequest(URLRequest(url: NetworkTools.sharedTools.OAuthURL as URL))
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc
    public func close(){
        self.dismiss(animated: true, completion: nil)
    }
    @objc
    public func autoFill(){
        var js="document.getElementById('userId').value='13112527542';"
        js+="document.getElementById('passwd').value='123';"
        webview.stringByEvaluatingJavaScript(from: js)
    }
}
extension OAuthViewController:UIWebViewDelegate{
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        guard let url = request.url , url.host == "www.baidu.com" else
        {
            return true
        }
        guard let query = url.query, query.hasPrefix("code=") else
        {
            print("取消授权")
            return false
        }
        let code = query.substring(from: "code=".endIndex)
        print(code)
        NetworkTools.sharedTools.loadAccessToken(code: code ){
            (result,error)->() in
            if error != nil{
                print("出错了")
                return
            }
            print(result)

            let account = UserAccount(dict:result as! [String:AnyObject])
            print(account)
            self.loadUserInfo(account: account)
        }
        return false
    }
    
    override func loadView() {
        view = webview
        webview.delegate = self
        title = "登录新浪微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(OAuthViewController.close))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", style: .plain, target: self, action: #selector(OAuthViewController.autoFill))
    }
    func loadUserInfo(account:UserAccount){
        NetworkTools.sharedTools.loadUserInfo(uid: account.uid!, accessToken: account.access_token!){
            (result,error)->Void in
            if error != nil{
                print("加载用户出错")
                return
            }
            guard let dict = result as? [String:AnyObject] else{
                print("格式错误")
                return
            }
            print(dict["screen_name"])
            print(dict["avatar_large"])
            
            account.screen_name = dict["screen_name"] as! String?
            account.avatar_large = dict["avatar_large"] as! String?
            
            print(account)
        }
    }
}
