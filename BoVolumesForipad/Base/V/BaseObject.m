//
//  BaseObject.m
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/16.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseObject.h"
CGFloat NavHeight = 0;
CGFloat TabBarHeight = 0;
CGFloat StatusBar = 0;
@implementation BaseObject
+ (NSArray *)TiemArray:(NSString *)time
                String:(NSString *)string{
    NSArray *array = [time componentsSeparatedByString:string]; //从字符A中分隔成2个元素的数组
    //    NSArray *timearray = [array[0] componentsSeparatedByString:@"-"]; //从字符A中分隔成2个元素的数组
    return array;
}
+ (NSMutableArray *)AllRang:(NSString *)text
          RangString:(NSString *)string{
    NSArray * array = [self TiemArray:text String:string];
    NSMutableArray * arr = [NSMutableArray array];
    NSString * endstr = @"";

    NSInteger inte = 0;
    for (NSString * str in array) {
        endstr = [endstr stringByAppendingString:str];
        NSRange rang = NSMakeRange(endstr.length, string.length);
        NSString * inter = [NSString stringWithFormat:@"%ld",endstr.length];
        endstr = [endstr stringByAppendingString:string];
        if (inte == array.count-1) {
        }else{
            inte ++ ;
            [arr addObject:inter];
        }
    }
    return arr;
}

/**
 *  计算文字长度
 */
+ (CGFloat )widthForLabel:(NSString *)text fontSize:(CGFloat)font
{
    CGSize size = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:font], NSFontAttributeName, nil]];
    return size.width;
}

/**
 转换颜色
 */
+(UIColor *) getColor:(NSString *)hexColor
{
    unsigned int red, green, blue;
    NSRange range;
    range.length =2;
    
    range.location =0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    range.location =2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    range.location =4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green/255.0f)blue:(float)(blue/255.0f)alpha:1.0f];
}



+ (UIViewController *)PopViewController:(NSArray *)Controller AllController:(NSArray *)allarray{
    for (UIViewController *controller in allarray) {
        for (UIViewController * twoViewController in Controller) {
            if ([controller isKindOfClass:[twoViewController class]]) {
                return twoViewController;
            }
        }
      
    }
    return [UIViewController new];
}
@end
