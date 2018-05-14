//
//  ZhiZiLvView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiZiLvView.h"

@implementation ZhiZiLvView{
    BaseView * leftview;
    BaseView * rightview;
    BaseLabel * leftname;
    BaseLabel * rightname;
    FLAnimatedImageView * leftimageview;
    FLAnimatedImageView * ringimageview;
    BaseButton * shizi;
    BaseButton * shici;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    leftview = [BaseView new];
    [self addSubview:leftview];

    rightview = [BaseView new];
    [self addSubview:rightview];
    
    //leftimageview
    leftimageview = [FLAnimatedImageView new];
    leftimageview.backgroundColor = RANDOMCOLOR;
    leftimageview.layer.cornerRadius = 30;
    leftimageview.layer.masksToBounds = YES;
    [leftview addSubview:leftimageview];
    //ringimageview
    ringimageview = [FLAnimatedImageView new];
    ringimageview.backgroundColor = RANDOMCOLOR;
    ringimageview.layer.cornerRadius = 30;
    ringimageview.layer.masksToBounds = YES;
    [rightview addSubview:ringimageview];
    
    //leftname
    leftname = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [leftimageview addSubview:leftname];
    //rightname
    rightname = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [ringimageview addSubview:rightname];
    
    shizi = [BaseButton buttonWithType:UIButtonTypeCustom];
    [shizi addTarget:self action:@selector(shizi) forControlEvents:UIControlEventTouchUpInside];
    [leftimageview addSubview:shizi];
    
     shici = [BaseButton buttonWithType:UIButtonTypeCustom];
    [shici addTarget:self action:@selector(shici) forControlEvents:UIControlEventTouchUpInside];
    [ringimageview addSubview:shici];
}
- (void)shizi{
    
}
- (void)shici{
    
}
- (void)layoutSubviews{
    WS(ws);
    [leftview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(self->rightview.mas_left).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(self->rightview);
    }];
    
    [rightview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).with.offset(0);
        make.left.equalTo(self->leftview.mas_right).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    [leftimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->leftview.mas_top).with.offset(5);
        make.bottom.equalTo(self->leftview.mas_bottom).with.offset(-5);
        make.left.equalTo(self->leftview.mas_left).with.offset(47);
        make.right.equalTo(self->leftimageview.mas_right).with.offset(-35);
        make.height.equalTo(self->leftimageview.mas_width).multipliedBy(0.4);

    }];

    [ringimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->rightview.mas_top).with.offset(5);
        make.bottom.equalTo(self->rightview.mas_bottom).with.offset(-5);
        make.left.equalTo(self->rightview.mas_left).with.offset(35);
        make.right.equalTo(self->rightview.mas_right).with.offset(-47);
        make.height.equalTo(self->ringimageview.mas_width).multipliedBy(0.4);

    }];

    [leftname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->leftview.center);
    }];

    [rightname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self->rightview.center);
    }];

    [shizi mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->leftimageview);
    }];

    [shici mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->ringimageview);
    }];
}
@end
