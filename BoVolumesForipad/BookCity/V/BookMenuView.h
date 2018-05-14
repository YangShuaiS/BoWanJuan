//
//  BookMenuView.h
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
@protocol BookMenuViewDelegate <NSObject>

@optional
- (void)BackButtonTitle:(NSString *)title;
@end

@interface BookMenuView : BaseView
@property (nonatomic,weak) id<BookMenuViewDelegate>delegete;

@end
