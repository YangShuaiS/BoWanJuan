//
//  BaseViewController.h
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<BaseViewDelegate>
@property (nonatomic, strong) NativeView* navtive;
- (void)AddNavtion;//添加导航栏
- (void)RefreshTheView;//刷新视图
- (void)QRCodeScanVC:(UIViewController *)scanVC;//二维码
@end
