//
//  BooStyleView.h
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BaseView.h"
@protocol BooStyleViewDelegate <NSObject>

@optional
- (void)scrollFloat:(CGFloat)flo;

@end
@interface BooStyleView : BaseView
@property (nonatomic,weak) id<BooStyleViewDelegate>delegete;

@end
