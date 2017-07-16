//
//  NavigationController.swift
//  QiYu
//
//  Created by 陈恩湖 on 2017/7/16.
//  Copyright © 2017年 Judson. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    var popRecognizer: UIPanGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let interactivePopGesture = self.interactivePopGestureRecognizer {
            
            interactivePopGesture.isEnabled = false
            
            let gestureView = interactivePopGesture.view
            popRecognizer = UIPanGestureRecognizer()
            popRecognizer.delegate = self
            popRecognizer.maximumNumberOfTouches = 1
            gestureView?.addGestureRecognizer(popRecognizer)
            
            guard let targets = interactivePopGesture.value(forKey: "_targets") as? NSMutableArray else {
                return
            }
            let popTarget = targets.firstObject as AnyObject?
            let navigationInteractiveTransition: Any? = popTarget?.value(forKey: "_target")
            let handleTranstion = NSSelectorFromString("handleNavigationTransition:")
            if let navigationInteractiveTransition = navigationInteractiveTransition {
                popRecognizer.addTarget(navigationInteractiveTransition, action: handleTranstion)
            }
        }
        setNeedsStatusBarAppearanceUpdate()
    }
}

extension NavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if popRecognizer.translation(in: self.view).x > 0 {
            guard let isTransition = self.value(forKey: "_isTransitioning") as AnyObject?, !isTransition.boolValue else {
                return false
            }
            return self.viewControllers.count != 1
        } else {
            return false
        }
    }
}
