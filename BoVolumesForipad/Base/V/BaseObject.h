//
//  BaseObject.h
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/16.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <Foundation/Foundation.h>
extern CGFloat NavHeight;
extern CGFloat TabBarHeight;
extern CGFloat StatusBar;
@interface BaseObject : NSObject
#pragma mark - 时间截取
+ (NSArray *)TiemArray:(NSString *)time
                String:(NSString *)string;
+ (NSMutableArray *)AllRang:(NSString *)text
                 RangString:(NSString *)string;
/**
 计算文字长度
 
 @param text 文字
 @param font 字体
 @return 长度
 */
+ (CGFloat )widthForLabel:(NSString *)text fontSize:(CGFloat)font;

/**
 16进制转换 颜色
 
 @param hexColor 颜色
 @return 转换后的颜色
 */
+(UIColor *) getColor:(NSString *)hexColor;

+ (UIViewController *)PopViewController:(NSArray *)Controller
                          AllController:(NSArray *)allarray;
@end
