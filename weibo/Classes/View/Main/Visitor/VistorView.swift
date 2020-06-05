//
//  VistorView.swift
//  weibo
//
//  Created by 陈先生 on 2020/4/8.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit
import AFNetworking
class VistorView: UIView {
    public lazy var iconImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    public lazy var homeIconView:UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    public lazy var maskIconView = UIImageView(image:UIImage(named:"visitordiscover_feed_mask_smallicon"))
    
    public lazy var messageLable:UILabel={
        let label = UILabel()
        label.text="关注一些人，回这里看看有什么惊喜"
        label.textColor=UIColor.darkGray
        label.font=UIFont.systemFont(ofSize: 14)
        label.numberOfLines=0
        label.textAlignment=NSTextAlignment.center
        return label
    }()
    
    public lazy var registerButton:UIButton={
        let button=UIButton()
        button.setTitle("注册", for: UIControl.State.normal)
        button.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        button.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: UIControl.State.normal)
        return button
    }()
    
    public lazy var loginButton:UIButton={
        let button=UIButton()
        button.setTitle("登录", for: UIControl.State.normal)
        button.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        button.setBackgroundImage(UIImage(named:"common_button_white_disable"), for: UIControl.State.normal)
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setUpUI()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension VistorView{
    public func setUpUI(){
        addSubview(iconImageView)
        addSubview(homeIconView)
        addSubview(messageLable)
        addSubview(registerButton)
        addSubview(loginButton)
        addSubview(maskIconView)
        
        for v in subviews{
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
        
        addConstraint(NSLayoutConstraint(item: homeIconView, attribute: .centerX, relatedBy: .equal, toItem: iconImageView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: homeIconView, attribute: .centerY, relatedBy: .equal, toItem: iconImageView, attribute: .centerY, multiplier: 1.0, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: messageLable, attribute: .centerX, relatedBy: .equal, toItem: iconImageView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: messageLable, attribute: .centerY, relatedBy: .equal, toItem: iconImageView, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: messageLable, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 224))
        addConstraint(NSLayoutConstraint(item: messageLable, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        //注册按钮
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .left, relatedBy: .equal, toItem: messageLable, attribute: .left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .top, relatedBy: .equal, toItem: messageLable, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: registerButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        //登录按钮
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .right, relatedBy: .equal, toItem: messageLable, attribute: .right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .top, relatedBy: .equal, toItem: messageLable, attribute: .bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: loginButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 36))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[mask]-0-|", options: [], metrics: nil, views: ["mask":maskIconView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[mask]-(btnHeight)-[regButton]", options: [], metrics: ["btnHeight":-36], views: ["mask":maskIconView,"regButton":registerButton]))
        
        backgroundColor = UIColor(white:237.0/255.0,alpha:1.0)
        
        
    }
    public func setupInfo(imageName:String?,title:String){
        messageLable.text = title
        guard let imgName = imageName else{
            startAnim()
            return
        }
        homeIconView.isHidden = true
        sendSubviewToBack(maskIconView)
        iconImageView.image = UIImage(named:imageName!)
    }
    
    public func startAnim(){
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2*M_PI
        anim.repeatCount = MAXFLOAT
        anim.duration = 20
        anim.isRemovedOnCompletion = false
        
        iconImageView.layer.add(anim, forKey: nil)
    }
}
