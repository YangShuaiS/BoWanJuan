//
//  Pch.swift
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/16.
//  Copyright © 2018年 YS. All rights reserved.
//
import Foundation
import UIKit
let WIDTH = UIScreen.main.bounds.size.width
let HEIGHT = UIScreen.main.bounds.size.height
// 当前系统版本
let  version = (UIDevice.current.systemVersion as NSString).floatValue
// NSUserDefault
let userDefault = UserDefaults.standard
// 通知中心
let notice = NotificationCenter.default
func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)->(UIColor) {
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    
}
func TextFont (f:CGFloat)->(UIFont){
    return UIFont.systemFont(ofSize: f)
}
