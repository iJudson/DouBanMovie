//
//  MenuViewController.swift
//  QiYu
//
//  Created by 陈恩湖 on 2017/7/16.
//  Copyright © 2017年 Judson. All rights reserved.
//

import UIKit
import RDVTabBarController

class MenuViewController: RDVTabBarController {
    
    fileprivate let normalTabBarImages = ["home", "account"]
    fileprivate let selectedTabBarImages = ["home_selected", "account_selected"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTabBar()
    }
    
    fileprivate func initializeTabBar() {
        let mainNav = UIStoryboard.NavigationController.home
        let profileCenterNav = UIStoryboard.NavigationController.profile
        viewControllers = [mainNav, profileCenterNav]
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: tabBarHeight))
        imageView.backgroundColor = UIColor.white
        tabBar.backgroundView.addSubview(imageView)
        tabBar.isTranslucent = true
        tabBar.backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.93)
        tabBar.frame.size.height = tabBarHeight
        
        guard let items = tabBar.items as? [RDVTabBarItem] else {
            return
        }
        
        for (idx, item) in items.enumerated() {
            item.addTargetForAnimation()
            item.setFinishedSelectedImage(UIImage(named: selectedTabBarImages[idx]), withFinishedUnselectedImage: UIImage(named: normalTabBarImages[idx]))
            item.imagePositionAdjustment.vertical = 0.0
            item.imagePositionAdjustment.horizontal = 1.0
        }
        
        delegate = self
        
        let topLineView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 0.5))
        topLineView.backgroundColor = ColorManager.commonLineColor
        tabBar.addSubview(topLineView)
    }
}

extension MenuViewController: RDVTabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: RDVTabBarController!, didSelect viewController: UIViewController!) {
    }
    
}
