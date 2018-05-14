


//
//  MedalMoreCollectionViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalMoreCollectionViewCell.h"

@implementation MedalMoreCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    WS(ws);
    BaseLabel * nName = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:@"..."];
    [self addSubview:nName];
    [nName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
}
@end
