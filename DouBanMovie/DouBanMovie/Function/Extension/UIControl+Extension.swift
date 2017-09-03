//
//  UIControl+Extension.swift
//  QiYu
//
//  Created by 陈恩湖 on 2017/7/12.
//  Copyright © 2017年 Judson. All rights reserved.
//

import UIKit

extension UIControl {
    
    fileprivate var kScaleToSmall: String {
        return "scaleToSmall"
    }
    fileprivate var kScaleAnimationWithSpring: String {
        return "scaleAnimationWithSpring"
    }
    fileprivate var kScaleToDefault: String {
        return "scaleToDefault"
    }
    
    func removeAnimatedTarget() {
        self.removeTarget(self, action: Selector(kScaleToSmall), for: .touchUpInside)
        self.removeTarget(self, action: Selector(kScaleAnimationWithSpring), for: .touchUpInside)
        self.removeTarget(self, action: Selector(kScaleToDefault), for: .touchDragExit)
    }
    
    func addTargetForAnimation() {
        self.addTarget(self, action: Selector(kScaleToSmall), for: .touchUpInside)//| .TouchDragEnter)
        self.addTarget(self, action: Selector(kScaleAnimationWithSpring), for: .touchUpInside)
        self.addTarget(self, action: Selector(kScaleToDefault), for: .touchDragExit)
    }
    
    @objc fileprivate func scaleToSmall() {
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil)
    }
    
    @objc fileprivate func scaleAnimationWithSpring() {
        UIView.animate(withDuration: 0.35, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    @objc fileprivate func scaleToDefault() {
        UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}
