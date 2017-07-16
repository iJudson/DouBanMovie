//
//  UIStoryboard+Extension.swift
//  QiYu
//
//  Created by 陈恩湖 on 2017/7/16.
//  Copyright © 2017年 Judson. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    static func getController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: identifier)
    }
    
    struct NavigationController {
        static var home: UINavigationController {
            return UIStoryboard.getController(withIdentifier: "HomeViewControllerNav") as! UINavigationController
        }
        static var profile: UINavigationController {
            return UIStoryboard.getController(withIdentifier: "ProfileCenterViewControllerNav") as! UINavigationController
        }
    }
    
    struct ViewController {
        static var home: UIViewController {
            return UIStoryboard.getController(withIdentifier: "HomeViewController")
        }
        static var profile: UIViewController {
            return UIStoryboard.getController(withIdentifier: "ProfileCenterViewController")
        }
    }
    
}
