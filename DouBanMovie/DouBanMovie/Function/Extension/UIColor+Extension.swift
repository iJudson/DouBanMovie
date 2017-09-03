//
//  UIColor+Extension.swift
//  QiYu
//
//  Created by 陈恩湖 on 2017/7/12.
//  Copyright © 2017年 Judson. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        
        if #available(iOS 10, *) {
            self.init(displayP3Red: r/255.0, green: g/255.0, blue: b/255.0, alpha: min(1.0, abs(a)))
        } else {
            self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: min(1.0, abs(a)))
        }
        
    }
    
}
