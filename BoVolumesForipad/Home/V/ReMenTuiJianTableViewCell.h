//
//  ReMenTuiJianTableViewCell.h
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKStarDisplayView.h"

@interface ReMenTuiJianTableViewCell : UITableViewCell
@property(nonatomic,assign)BookCaseStyle bookCase;

@property(nonatomic,strong) JKStarDisplayView *jKStarDisplayView;

@end
