//
//  BaseENUM.h
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark -------------- Nav样式
typedef NS_ENUM(NSInteger, NavStyle) {
    NavStyleGeneral = 0,//通用,左返回中title
    NavStyleHome = 1, //首页
    NacStyleFound = 2, //发现
    NacStyleBookCity = 3, //发现
};
#pragma mark -------------- 书架样式
typedef NS_ENUM(NSInteger, BookCaseStyle) {
    BookCaseStyleWD = 0,//未读
    BookCaseStyleYD = 1, //已读
    BookCaseStyleHomeYD = 2, //首页已读
    BookCaseStyleHomeWD = 3, //首页未读


};

#pragma mark -------------- MenuStyle
typedef NS_ENUM(NSInteger, MenuStyle) {
    MenuStyleKH = 0,//可滑动
    MenuStyleBKH = 1, //不可滑动
};

#pragma mark -------------- XQXC or 勋章详情
typedef NS_ENUM(NSInteger, ViewControllerStyle) {
    ViewControllerStyleXZXQ = 0,//勋章详情
    ViewControllerStyleXQAH = 1, //兴趣爱好
};

#pragma mark -------------- 精读图书or不精读
typedef NS_ENUM(NSInteger, BookReadingStyle) {
    BookIntensiveReading = 0,//精读
    BookExtensiveReading = 1, //泛读
};
@interface BaseENUM : NSObject

@end
