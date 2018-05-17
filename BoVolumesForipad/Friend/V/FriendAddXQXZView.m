



//
//  FriendAddXQXZView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendAddXQXZView.h"

@implementation FriendAddXQXZView{
    FLAnimatedImageView * imageView;
    BaseLabel * title;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    imageView  = [FLAnimatedImageView new];
    imageView.backgroundColor = RANDOMCOLOR;
    [self addSubview:imageView];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(17) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [self addSubview:title];
    
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(LENGTH(150));
        make.height.mas_equalTo(LENGTH(100));
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).with.offset(LENGTH(20));
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(36));

    }];
}

@end
