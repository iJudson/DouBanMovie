//
//  String+Extension.swift
//  QiYu
//
//  Created by 陈恩湖 on 2017/7/9.
//  Copyright © 2017年 Judson. All rights reserved.
//

import Foundation

enum FolderKey {
    case folderDocuments
    case folderCaches
    case folderTmp
}

extension String {
    
    var isEnglishCharacter: Bool {
        for char in self.utf8 {
            if char > 64 && char < 91 || char > 96 && char < 123 {
                return true
            }
            return false
        }
        return false
    }
    
    var isGIF: Bool {
        return self.contains(".gif")
    }
    
    var isNumberCharacter: Bool {
        for char in self.utf8 {
            if char > 47 && char < 58 {
                return true
            }
            return false
        }
        return false
    }
    
    var isEmptyCharacter: Bool {
        let resetText = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return resetText.isEmpty ? true : false
    }
    
    var chineseCharacterCount: Int {
        var currentNumber = self.characters.count
        var englishCount = 0
        for character in self.characters {
            let characterString = String(character)
            if characterString.isEnglishCharacter || characterString.isNumberCharacter {
                englishCount += 1
            }
        }
        currentNumber -= Int(Float(englishCount/2) + 0.5)
        return currentNumber
    }
    
    // 通过正则表达式替换匹配
    func stringByReplacingOccurrencesOfRegularExpression(_ contentText: String, patternString: String, template: String) -> String {
        var content = contentText
        do {
            let expression = try NSRegularExpression(pattern: patternString, options: .caseInsensitive)
            let contentRange = NSRange(location: 0, length: content.characters.count)
            content = expression.stringByReplacingMatches(in: content, options: .reportCompletion, range: contentRange, withTemplate: template)
        } catch {
            print("转换过程中出现错误")
        }
        return content
    }
    
    func stringByAppendingPathComponent(_ path: String) -> String {
        return (self as NSString).appendingPathComponent(path)
    }
    
    static func pathForFolder(_ folder: FolderKey, fileName: String = "") -> String {
        let documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let cachesDirectoryPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
        let folderName: String?
        switch folder {
        case .folderDocuments:
            return documentsDirectoryPath.stringByAppendingPathComponent(fileName)
            
        case .folderCaches:
            return cachesDirectoryPath.stringByAppendingPathComponent(fileName)
            
        case .folderTmp:
            folderName = "tmp"
        }
        
        let path = NSHomeDirectory().stringByAppendingPathComponent(folderName!).stringByAppendingPathComponent(fileName)
        return path
        
    }
    
    func convertVersionStrToFloat() -> Float {
        
        let versions = (self as NSString).components(separatedBy: ".")
        var myVersion: Float = 0.0
        if versions.count > 2 {
            myVersion = ("\(versions[0]).\(versions[1])\(versions[2])" as NSString).floatValue
        } else {
            myVersion = ("\(versions[0]).\(versions[1])" as NSString).floatValue
        }
        return myVersion
    }
    
    var isImageUrl: Bool {
        let detailStr = self.detailImageURLStringFromExtension
        if detailStr.hasSuffix(".png") || detailStr.hasSuffix(".jpg") ||
            detailStr.hasSuffix(".gif") || detailStr.hasSuffix(".jpeg") {
            return true
        }
        return false
    }
    
    /// HTML 字符转义
    var htmlEntityDecode: String {
        
        guard contains("&") else {
            return self
        }
        
        var text = replacingOccurrences(of: "&quot;", with: "\"")
        text = text.replacingOccurrences(of: "&apos;", with: "'")
        text = text.replacingOccurrences(of: "&lt;", with: "<")
        text = text.replacingOccurrences(of: "&gt;", with: ">")
        text = text.replacingOccurrences(of: "&amp;", with: "&")
        text = text.replacingOccurrences(of: "&nbsp;", with: "")
        
        return text
    }
    
    var encodingURLString: String {
        var content = self
        if contains("%") {
            if let contentWithoutEncoding = content.removingPercentEncoding {
                content = contentWithoutEncoding
            }
        }
        return content.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? content
    }
    
    static func getUploadImageUrlStr(index: Int) -> String {
        return "appso://upload_image_\(index).jpg"
    }
    
    var isMatchIfanrCdn: Bool {
        let pattern = "(http(s)?:\\/\\/)?(images.ifanr.cn|ifanr-cdn.b0.upaiyun.com)\\/.*?"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        let isMatch = predicate.evaluate(with: self)
        return isMatch
    }
    
    func getImageUrlStringWithResolution(_ resolution: String) -> String {
        let urlString = self.detailImageURLStringFromExtension
        return urlString + (urlString.isMatchIfanrCdn ? resolution : "")
        
    }
    
    // 在题图链接的后面加上 !540 获取相对应分辨率的题图
    var illustrationImageURLStringFromExtension: String {
        return getImageUrlStringWithResolution(illustrationImageResolution)
    }
    
    // 在题图链接的后面加上 !320 获取相对应分辨率的题图
    var smallCoverImageURLStringFromExtension: String {
        return getImageUrlStringWithResolution(similarArticleImageResolution)
    }
    
    var detailImageURLStringFromExtension: String {
        
        let urlString = self
        if urlString.isMatchIfanrCdn && urlString.contains("!") {
            let components = urlString.components(separatedBy: "!")
            if let urlStr = components.first {
                return urlStr
            }
        }
        return urlString
    }
    
    var imageResolution: Int {
        let urlString = self
        if urlString.isMatchIfanrCdn && urlString.contains("!") {
            let components = urlString.components(separatedBy: "!")
            if let resolutionStr = components.last, let resolution = Int(resolutionStr) {
                return resolution
            }
        }
        return Int.max
    }

}
