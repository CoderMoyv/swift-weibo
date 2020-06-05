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
        view = webview
        title = "登录新浪微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .plain, target: self, action: #selector(OAuthViewController.close))
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
}
