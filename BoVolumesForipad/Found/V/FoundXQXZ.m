//
//  FoundXQXZ.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundXQXZ.h"
#import "DCCycleScrollView.h"
@interface FoundXQXZ ()<DCCycleScrollViewDelegate>

@end
@implementation FoundXQXZ{
    MenuNav * menuNav;
    DCCycleScrollView *banner;
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [banner removeFromSuperview];
    banner = nil;
    if (banner == nil) {
        banner = [DCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0,0, 0) shouldInfiniteLoop:YES imageGroups:itemarray];
        //    banner.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
        //    banner.cellPlaceholderImage = [UIImage imageNamed:@"placeholderImage"];
        banner.autoScroll = NO;
        banner.isZoom = YES;
        banner.itemSpace = 0;
        banner.imgCornerRadius = 10;
        banner.itemWidth = LENGTH(551);
        banner.delegate = self;
        banner.pageControl.hidden = YES;
        [self addSubview:banner];
        
        WS(ws);
        [banner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws).with.offset(0);
            make.top.equalTo(self->menuNav.mas_bottom).with.offset(LENGTH(35));
            make.right.equalTo(ws).with.offset(0);
            make.bottom.equalTo(ws).with.offset(-LENGTH(35));
            make.height.mas_equalTo(LENGTH(221));
        }];
    }
    
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor = backColor;
    
    menuNav = [MenuNav new];
    menuNav.titles = @"同学最爱";
    menuNav.menuNavStyle = MenuNavStyleTitle;
    [self addSubview:menuNav];
    
    WS(ws);
    [menuNav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
    }];
    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
