//
//  UIBut+Extension.swift
//  weibo
//
//  Created by 陈先生 on 2020/4/8.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit
extension UIButton
{
    convenience init(imagesName:String,backImageName:String)
    {
        self.init()
        setImage(UIImage(named:imagesName),for:.normal)
        setImage(UIImage(named:imagesName+"_highlighted"),for:.highlighted)
        setBackgroundImage(UIImage(named:backImageName),for: .normal)
        setBackgroundImage(UIImage(named:backImageName+"_highlighted"),for:.highlighted)
        sizeToFit()
        
    }
    convenience init(title:String,color:UIColor,imageName:String){
        self.init()
        setTitle(title, for:.normal)
        setTitleColor(color, for: .normal)
        setBackgroundImage(UIImage(named:imageName), for: .normal)
        sizeToFit()
    }
}
