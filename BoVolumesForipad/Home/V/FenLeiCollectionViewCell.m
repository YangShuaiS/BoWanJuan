//
//  FenLeiCollectionViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FenLeiCollectionViewCell.h"

@implementation FenLeiCollectionViewCell
{
    FLAnimatedImageView * imageView;
    BaseLabel * name;
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
    imageView.layer.cornerRadius = 35;
    imageView.layer.masksToBounds = YES;
    [self.contentView addSubview:imageView];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:@"首页"];
    [self.contentView addSubview:name];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws);
        make.top.equalTo(ws).with.offset(23);
        make.height.mas_offset(70);
        make.width.mas_offset(70);
    }];
    
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws);
        make.top.equalTo(self->imageView.mas_bottom).with.offset(20);
        make.width.mas_offset(100);
        make.bottom.equalTo(ws).with.offset(-20);

    }];
}
@end
