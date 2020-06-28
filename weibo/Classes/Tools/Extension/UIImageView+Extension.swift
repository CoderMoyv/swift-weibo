//
//  UIImageView+Extension.swift
//  weibo
//
//  Created by 陈先生 on 2020/6/28.
//  Copyright © 2020 chen. All rights reserved.
//

import UIKit

extension UIImageView
{
    convenience init(imageName:String)
    {
        self.init(image:UIImage(named:imageName))
    }
}
