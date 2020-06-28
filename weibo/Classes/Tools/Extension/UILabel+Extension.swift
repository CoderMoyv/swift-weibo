//
//  UILabel+Extension.swift
//  weibo
//
//  Created by 陈先生 on 2020/6/28.
//  Copyright © 2020 chen. All rights reserved.
//
import UIKit

extension UILabel
{
    convenience init(title:String,fontSzie:CGFloat = 14,color:UIColor = UIColor.darkGray)
    {
        self.init()
        text = title
        textColor = color
        font = UIFont.systemFont(ofSize: fontSzie)
        numberOfLines = 0
        textAlignment = NSTextAlignment.center
    }
}
