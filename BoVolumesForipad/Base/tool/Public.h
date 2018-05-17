//
//  Public.h
//  LOL
//
//  Created by Kean on 16/7/1.
//  Copyright © 2016年 Kean. All rights reserved.
//

#ifndef Public_h
#define Public_h
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT  [UIScreen mainScreen].bounds.size.height
#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define LENGTH(x)       (x*([UIScreen mainScreen].bounds.size.width/768.0))
#define XIANGSU(x) (x*[UIScreen mainScreen].scale)
#define MENU  LENGTH(54)

#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define ZSFWQ @"http://150.242.250.87:9000"


// 相对iphone6S 屏幕比
#define KWidth_ScaleW [UIScreen mainScreen].bounds.size.width/414.0f
#define KWidth_ScaleH [UIScreen mainScreen].bounds.size.height/736.0f

// tabBar的背景色
#define TabBar_T_Color RGB(191, 31, 31)
#define TABBARHeight self.tabBarController.tabBar.frame.size.height
#define NAVIGATIONHeight self.navigationController.navigationBar.frame.size.height
#define STAUBARHEIGHT [[UIApplication sharedApplication]  valueForKey:@"statusBar"];

// RGB
#define RGBA(r, g, b, a)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)  RGBA(r, g, b, 1.0f)
#define TabBarTitleColor RGB(0xff, 0x30, 0x1a)
#define RANDOMCOLORALPHA(f) [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:f];
#define RANDOMCOLOR [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0f];

// 系统版本
#define SYTEM_VERSION [[UIDevice currentDevice].systemVersion floatValue]


//通知名称
#define kNotificationDenglu        @"kNotificationDenglu"

//字体大小
#define TextFont(f) [UIFont systemFontOfSize:FontSize(LENGTH(f))]
//跟视图数量
#define ChildViewControllersCount self.navigationController.childViewControllers.count
//plist文件
#define UserMe @"UserMe.plist"

#define XAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//展位图
#define UIIMAGE(image) [UIImage imageNamed:@image]

//各种颜色
#define DT_LABELCOLOR RGB(33, 33, 33)//答题label颜色


#ifdef DEBUG
#   define SDLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define SDLog(...)
#   define ELog(err)
#endif

#define mHexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define fontHightColor mHexRGB(0x3c3c3c) //字体深色
#define fontNomalColor mHexRGB(0xa0a0a0) //字体浅色
#define bjColor mHexRGB(0xe4e4e4)  //背景灰色
#define borderCol mHexRGB(0xe4e4e4)    //border颜色

#define MAINCOLOR [UIColor colorWithRed:75.0/255.0f green:183/255.0f blue:178/255.0f alpha:1]   //主颜色
#define BEIJINGCOLOR [UIColor colorWithRed:241.0/255.0f green:244/255.0f blue:246/255.0f alpha:1]   //背景色



#define LinShiFont 15
#define LinShiZiTiYanSe mHexRGB(0x333333)
#define ZHANWEIZI @"我是占位字"
#define CHANGWENZI @"我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字我是长文字"

#define Font20 20
#define Font18 18
#define Font17 17
#define Font16 16
#define Font15 15
#define Font14 14
#define Font13 13
#define Font12 12
#define Font11 11



#define backColor [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1] 
#endif /* Public_h */
