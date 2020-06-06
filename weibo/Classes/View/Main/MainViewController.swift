//
//  MainViewController.swift
//  weibo
//
//  Created by 陈先生 on 2020/3/25.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    public lazy var composedButton:UIButton = UIButton(imagesName: "tabbar_compose_icon_add", backImageName: "tabbar_compose_button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChidViewControllers()
        NetworkTools.sharedTools.request(method: .GET, URLString: "http://httpbin.org/get", parameters: ["name":"zhangsan" as AnyObject,"age":18 as AnyObject], finished: {(result,error)->() in print(error)})
        NetworkTools.sharedTools.request(method: .POST, URLString: "http://httpbin.org/post", parameters: ["name":"zhangsan" as AnyObject,"age":18 as AnyObject], finished: {(result,error)->() in print(error)})
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MainViewController{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.bringSubviewToFront(composedButton)
    }
    public func addChidViewControllers(){
        tabBar.tintColor=UIColor.orange
        addChildViewController(vc:HomeTableViewController(),title:"首页",imageName:"tabbar_home")
        addChildViewController(vc:MessageTableViewController(),title:"消息",imageName:"tabbar_message_center")
        addChild(UIViewController())
        addChildViewController(vc:DiscoverTableViewController(),title:"发现",imageName:"tabbar_discover")
        addChildViewController(vc:ProfileTableViewController(),title:"我",imageName:"tabbar_profile")
        setupComposeButton()
    }
    private func addChildViewController(vc:UIViewController,title:String,imageName:String){
        vc.title=title
        vc.tabBarItem.image=UIImage(named: imageName)
        let nav=UINavigationController(rootViewController: vc)
        addChild(nav)
    }
    public func setupComposeButton()
    {
        tabBar.addSubview(composedButton)
        let count = children.count
        let w = tabBar.bounds.width/CGFloat(count)-1
        composedButton.frame=CGRect(x: 2*w, y: 0.0, width: w, height: tabBar.bounds.height)
        composedButton.addTarget(self, action: #selector(MainViewController.clickComposedButton), for:.touchUpInside )
    }
    @objc
    public func clickComposedButton(){
        print("???")
    }
    
}
