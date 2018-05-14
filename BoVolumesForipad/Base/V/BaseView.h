//
//  BaseView.h
//  BoVolumes
//
//  Created by 杨帅 on 2018/4/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BaseViewDelegate // 代理传值方法
@optional
- (void)PushFriendViewCOntroller;
@end
@interface BaseView : UIView
@property (nonatomic, weak) id <BaseViewDelegate> delegate;

@end
