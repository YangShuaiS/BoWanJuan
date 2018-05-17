

//
//  ShiDuCollectionViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/15.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ShiDuCollectionViewCell.h"

@implementation ShiDuCollectionViewCell{
    FLAnimatedImageView * imageView;
    BaseLabel * Title;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    imageView = [FLAnimatedImageView new];
    imageView.backgroundColor = RANDOMCOLOR;
    [self addSubview:imageView];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentCenter Text:CHANGWENZI];
    [self addSubview:Title];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).with.offset(0);
        make.left.equalTo(ws.mas_left).with.offset(0);
        make.right.equalTo(ws.mas_right).with.offset(0);
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).with.offset(LENGTH(12));
        make.bottom.equalTo(ws).with.offset(0);
        make.left.equalTo(ws.mas_left).with.offset(0);
        make.right.equalTo(ws.mas_right).with.offset(0);
    }];
}
@end
