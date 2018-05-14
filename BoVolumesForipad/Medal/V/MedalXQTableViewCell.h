//
//  MedalXQTableViewCell.h
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MedalXQDelegate // 代理传值方法
@optional
- (void)PushFriendViewCOntroller;
@end
@interface MedalXQTableViewCell : UITableViewCell
@property (nonatomic, weak) id <MedalXQDelegate> delegate;

@end
