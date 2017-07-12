//
//  NSDate+Extension.swift
//  QiYu
//
//  Created by 陈恩湖 on 2017/7/12.
//  Copyright © 2017年 Judson. All rights reserved.
//

import Foundation


let kMinute = 60
let kDay = kMinute * 24
let kWeek = kDay * 7
let kMonth = kDay * 31
let kYear = kDay * 365

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

extension Date {
    
    var timeAgo: String {
        let now = Date()
        let deltaSeconds = Int(fabs(timeIntervalSince(now)))
        let deltaMinutes = deltaSeconds / 60
        var value: Int = deltaMinutes
        
        if deltaSeconds < 5 {
            // Just Now
            return "刚刚"
        } else if deltaSeconds < kMinute {
            // Seconds Ago
            return "\(deltaSeconds) 秒前"
        } else if deltaSeconds < 120 {
            // A Minute Ago
            return "1 分钟前"
        } else if deltaMinutes < kMinute {
            // Minutes Ago
            return "\(deltaMinutes) 分钟前"
        } else if deltaMinutes < 120 {
            // An Hour Ago
            return "1 小时前"
        } else if deltaMinutes < kDay {
            // Hours Ago
            value = Int(floor(Float(deltaMinutes / kMinute)))
            return "\(value) 小时前"
        } else if deltaMinutes < (kDay * 2) {
            // Yesterday
            return "昨天"
        } else if deltaMinutes < kWeek {
            // Days Ago
            value = Int(floor(Float(deltaMinutes / kDay)))
            return "\(value) 天前"
        } else if deltaMinutes < (kWeek * 2) {
            // Last Week
            return "7 天前"
        } else if deltaMinutes < kMonth {
            // Weeks Ago
            return dateFormatter.string(from: self)
        } else if deltaMinutes < (kDay * 61) {
            // Last month
            return  "1 个月前"
        } else if deltaMinutes < kYear {
            // Month Ago
            return dateFormatter.string(from: self)
        } else if deltaMinutes < (kDay * (kYear * 2)) {
            // Last Year
            return dateFormatter.string(from: self)
        }
        return dateFormatter.string(from: self)
    }
    
    var timeAgoForDiscount: String {
        let now = Date()
        let deltaSeconds = Int(fabs(timeIntervalSince(now)))
        let deltaMinutes: Int = deltaSeconds / 60
        
        var value: Int = deltaMinutes
        let discountDateFormatter = DateFormatter()
        discountDateFormatter.dateFormat = "MM-dd"
        if deltaSeconds < 5 {
            // Just Now
            return "刚刚"
        } else if deltaSeconds < kMinute {
            // Seconds Ago
            return "\(deltaSeconds) 秒前"
        } else if deltaSeconds < 120 {
            // A Minute Ago
            return "1 分钟前"
        } else if deltaMinutes < kMinute {
            // Minutes Ago
            return "\(deltaMinutes) 分钟前"
        } else if deltaMinutes < 120 {
            // An Hour Ago
            return "1 小时前"
        } else if deltaMinutes < kDay {
            // Hours Ago
            value = Int(floor(Float(deltaMinutes / kMinute)))
            return "\(value) 小时前"
        } else if deltaMinutes < (kDay * 2) {
            // Yesterday
            return "昨天"
        } else if deltaMinutes < kWeek {
            // Days Ago
            value = Int(floor(Float(deltaMinutes / kDay)))
            return "\(value) 天前"
        } else if deltaMinutes < (kWeek * 2) {
            // Last Week
            return "7 天前"
        } else if deltaMinutes < kMonth {
            // Weeks Ago
            return discountDateFormatter.string(from: self)
        } else if deltaMinutes < (kDay * 61) {
            // Last month
            return  "1 个月前"
        } else if deltaMinutes < kYear {
            // Month Ago
            return discountDateFormatter.string(from: self)
        } else if deltaMinutes < (kDay * (kYear * 2)) {
            // Last Year
            return discountDateFormatter.string(from: self)
        }
        return discountDateFormatter.string(from: self)
    }
    
    var timeAgoForTitle: String {
        let now = Date()
        let deltaSeconds = Int(fabs(timeIntervalSince(now)))
        let deltaMinutes: Int = deltaSeconds / 60
        
        var value: Int = deltaMinutes
        
        if deltaSeconds < 5 {
            // Just Now
            return "今天"
        } else if deltaSeconds < kMinute {
            // Seconds Ago
            return "今天"
        } else if deltaSeconds < 120 {
            // A Minute Ago
            return "今天"
        } else if deltaMinutes < kMinute {
            // Minutes Ago
            return "今天"
        } else if deltaMinutes < 120 {
            // An Hour Ago
            return "今天"
        } else if deltaMinutes < kDay {
            // Hours Ago
            value = Int(floor(Float(deltaMinutes / kMinute)))
            return "今天"
        } else if deltaMinutes < (kDay * 2) {
            // Yesterday
            return "昨天"
        } else if deltaMinutes < kWeek {
            // Days Ago
            value = Int(floor(Float(deltaMinutes / kDay)))
            return "\(value) 天前"
        } else if deltaMinutes < (kWeek * 2) {
            // Last Week
            return "七天前"
        } else if deltaMinutes < kMonth {
            // Weeks Ago
            return dateFormatter.string(from: self)
        } else if deltaMinutes < (kDay * 61) {
            return  "上个月"
        } else if deltaMinutes < kYear {
            // Month Ago
            return dateFormatter.string(from: self)
        } else if deltaMinutes < (kDay * (kYear * 2)) {
            // Last Year
            return dateFormatter.string(from: self)
        }
        return dateFormatter.string(from: self)
    }
    
}
