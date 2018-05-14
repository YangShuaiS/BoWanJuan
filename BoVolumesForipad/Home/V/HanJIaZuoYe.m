//
//  HanJIaZuoYe.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HanJIaZuoYe.h"

@implementation HanJIaZuoYe{
    BaseView * backView;
    FLAnimatedImageView * leftImage;
    BaseLabel * title;
    FLAnimatedImageView * rightImage;

}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    backView = [BaseView new];
    backView.backgroundColor = RANDOMCOLOR;
    backView.layer.cornerRadius = 10;
    backView.layer.masksToBounds = YES;
    [self addSubview:backView];
    
    leftImage = [FLAnimatedImageView new];
    leftImage.backgroundColor = RANDOMCOLOR;
    [backView addSubview:leftImage];
    
    rightImage = [FLAnimatedImageView new];
    rightImage.backgroundColor = RANDOMCOLOR;
    [backView addSubview:rightImage];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:CHANGWENZI];
    title.numberOfLines = 0;
    [backView addSubview:title];
}
- (void)layoutSubviews{
    WS(ws);
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(12);
        make.top.equalTo(ws).with.offset(10);
        make.right.equalTo(ws).with.offset(-12);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->backView.mas_left).with.offset(12);
        make.top.equalTo(self->backView.mas_top).with.offset(12);
//        make.centerY.mas_equalTo(self->backView.mas_centerY);
        make.height.mas_offset(50);
        make.width.mas_offset(50);
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(-12);
    }];
    
    [rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->backView.mas_right).with.offset(-12);
        make.top.equalTo(self->backView.mas_top).with.offset(12);
//        make.centerY.mas_equalTo(self->backView.mas_centerY);
        make.height.mas_offset(50);
        make.width.mas_offset(50);
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(-12);
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImage.mas_right).with.offset(12);
        make.right.equalTo(self->rightImage.mas_left).with.offset(-12);
        make.top.equalTo(self->backView.mas_top).with.offset(12);
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(-12);
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
