//
//  UIButton+Extension.swift
//  QiYu
//
//  Created by 陈恩湖 on 2017/7/10.
//  Copyright © 2017年 Judson. All rights reserved.
//

import UIKit

extension UIButton {
    // 改原来左图右文字 为 左文字右图
    func setLeftTitleAttributeAndRightImageWithPadding(titleAttribute attribute: NSAttributedString?, image: UIImage?, padding: CGFloat = 2, state: UIControlState = .normal) {
        self.setImage(image, for: state)
        self.setAttributedTitle(attribute, for: state)
        let imageWidth: CGFloat = self.imageView?.frame.size.height ?? 0
        let labelWidth: CGFloat = self.titleLabel?.frame.size.width ?? 0
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth + padding * 0.5, bottom: 0, right: -labelWidth - padding * 0.5)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth - padding * 0.5, bottom: 0, right: imageWidth + padding * 0.5)
    }
}
