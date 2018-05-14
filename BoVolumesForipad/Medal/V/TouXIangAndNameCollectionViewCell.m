//
//  TouXIangAndNameCollectionViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TouXIangAndNameCollectionViewCell.h"

@implementation TouXIangAndNameCollectionViewCell{
    FLAnimatedImageView * touxiang;
    BaseLabel * nName;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    WS(ws);
    touxiang = [FLAnimatedImageView new];
    touxiang.backgroundColor = RANDOMCOLOR;
    touxiang.layer.cornerRadius = LENGTH(20);
    touxiang.layer.masksToBounds = YES;
    [self addSubview:touxiang];
    
    nName = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:nName];
    
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(10));
        make.centerX.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(LENGTH(40));
        make.height.mas_equalTo(LENGTH(40));
    }];
    
    [nName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->touxiang.mas_bottom).with.offset(10);
        make.centerX.mas_equalTo(ws);
        make.width.mas_equalTo(ws);
    }];
}
@end
