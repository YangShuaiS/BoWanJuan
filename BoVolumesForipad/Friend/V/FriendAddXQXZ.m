//
//  FriendAddXQXZ.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendAddXQXZ.h"
#import "FriendAddXQXZView.h"
@implementation FriendAddXQXZ{
    BaseLabel * title;
    NSMutableArray * array;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor = [UIColor whiteColor];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(20) TextAlignment:NSTextAlignmentCenter Text:@"加入的兴趣小组"];
    [self addSubview:title];
    
    
    WS(ws);
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(38));
        make.right.equalTo(ws).with.offset(0);
    }];
    array = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        FriendAddXQXZView * view = [FriendAddXQXZView new];
        [self addSubview:view];
        [array addObject:view];
    }
    CGFloat padding = LENGTH(60);

    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:padding leadSpacing:padding tailSpacing:padding];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->title.mas_bottom).offset(LENGTH(40));
//        make.height.mas_equalTo(140);
        make.bottom.equalTo(ws).offset(0);
    }];
}
@end
