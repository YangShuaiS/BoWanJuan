//
//  XingQuXiaoZiCollectionViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "XingQuXiaoZiCollectionViewCell.h"

@implementation XingQuXiaoZiCollectionViewCell{
    BaseView * backView;
    FLAnimatedImageView * imageView;
    BaseLabel * Title;
    BaseLabel * ren;

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
    backView = [BaseView new];
    backView.backgroundColor = RANDOMCOLOR;
    backView.layer.borderWidth = 1;
    backView.layer.borderColor = [UIColor blackColor].CGColor;
    backView.layer.cornerRadius = 10;
    backView.layer.masksToBounds = YES;
    [self.contentView addSubview:backView];
    
    imageView = [FLAnimatedImageView new];
    imageView.backgroundColor = RANDOMCOLOR;
    imageView.layer.cornerRadius = 10;
    imageView.layer.masksToBounds = YES;
    [backView addSubview:imageView];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:CHANGWENZI];
//    Title.numberOfLines = 2;
    [backView addSubview:Title];
    
    FLAnimatedImageView * rentouImage = [FLAnimatedImageView new];
    rentouImage.backgroundColor = RANDOMCOLOR;
    [backView addSubview:rentouImage];
    
    ren = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:@"9999人"];
    [backView addSubview:ren];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(20);
        make.top.equalTo(ws).with.offset(20);
        make.right.equalTo(ws).with.offset(-0);
        make.bottom.equalTo(ws).with.offset(-20);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_top).with.offset(12);
        make.left.equalTo(self->backView.mas_left).with.offset(12);
        make.right.equalTo(self->backView.mas_right).with.offset(-12);
        make.height.mas_equalTo(self->imageView.mas_width);
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).with.offset(20);
        make.left.equalTo(self->backView.mas_left).with.offset(20);
        make.right.equalTo(self->backView.mas_right).with.offset(-20);
    }];

    [rentouImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(-12);
        make.left.equalTo(self->backView.mas_left).with.offset(12);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];

    [ren mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(rentouImage.mas_right).with.offset(12);
        make.right.equalTo(self->backView.mas_right).with.offset(-12);
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(-12);
    }];
}
- (void)layoutSubviews{
    
}
- (void)layoutIfNeeded{
    [super layoutIfNeeded];
}
@end
