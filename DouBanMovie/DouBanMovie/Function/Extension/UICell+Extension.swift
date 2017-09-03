//
//  UICell+Extension.swift
//  QiYu
//
//  Created by 陈恩湖 on 2017/7/10.
//  Copyright © 2017年 Judson. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    static func cell_shortClassName() -> String {
        let nameSpaceClassName = "\(self)"
        let shortClassName = nameSpaceClassName.components(separatedBy: ".").last! as String
        return shortClassName
    }
}

extension UICollectionReusableView {
    
    static var className: String {
        return self.cell_shortClassName()
    }
    
    static func cell_shortClassName() -> String {
        let nameSpaceClassName = "\(self)"
        let shortClassName = nameSpaceClassName.components(separatedBy: ".").last! as String
        return shortClassName
    }
    
}

extension UICollectionView {
    func registerForCell(className: String, identifier: String? = nil) {
        let cellIdentifier = identifier ?? className
        self.register(UINib(nibName: className, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func registerCells(withClassNames classNames: [String]) {
        classNames.forEach { (className) in
            self.register(UINib(nibName: className, bundle: nil), forCellWithReuseIdentifier: className)
        }
    }
    
    func registerForHeader(className: String, identifier: String? = nil) {
        let headerIdentifier = identifier ?? className
        self.register(UINib(nibName: className, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
    }
    
    func registerForFooter(className: String, identifier: String? = nil) {
        let footerIdentifier = identifier ?? className
        self.register(UINib(nibName: className, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier)
    }
}
