
//
//  BookXQTopView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookXQTopView.h"

@implementation BookXQTopView{
    FLAnimatedImageView * leftImageView;
    BaseLabel * Title;
    BaseView * xingxing;
    BaseLabel * subtitle;

    BaseLabel * dengji;
    BaseLabel * nengli;
    BaseView * xunzhang;
    
    BaseLabel * longtext;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    self.backgroundColor = RANDOMCOLOR;
    leftImageView = [FLAnimatedImageView new];
    leftImageView.backgroundColor = RANDOMCOLOR;
    [self addSubview:leftImageView];
    
    [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(85));
        make.top.equalTo(ws).with.offset(NavHeight+LENGTH(20));
        make.width.mas_equalTo(LENGTH(150));
        make.height.mas_equalTo(LENGTH(225));
    }];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Title];
    
    xingxing = [BaseView new];
    xingxing.backgroundColor = RANDOMCOLOR;
    [self addSubview:xingxing];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:subtitle];
    
    BaseLabel * DJ = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:DJ];
    
    dengji = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:@"lv999"];
    [self addSubview:dengji];
    
    BaseLabel * NL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:NL];
    
    nengli = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:nengli];
    
    xunzhang = [BaseView new];
    xunzhang.backgroundColor = RANDOMCOLOR;
    [self addSubview:xunzhang];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(20));
        make.top.equalTo(self->leftImageView.mas_top).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(-LENGTH(85));
    }];

    [xingxing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(20));
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(-LENGTH(85));
        make.height.mas_equalTo(LENGTH(20));
    }];

    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(20));
        make.top.equalTo(self->xingxing.mas_bottom).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(-LENGTH(85));
    }];

    [DJ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(20));
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(10));
    }];

    [dengji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(DJ.mas_right).with.offset(LENGTH(10));
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(10));
    }];

    [NL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->dengji.mas_right).with.offset(LENGTH(20));
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(10));
    }];

    [nengli mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(NL.mas_right).with.offset(LENGTH(10));
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(10));
    }];

    [xunzhang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_right).with.offset(LENGTH(20));
        make.top.equalTo(self->nengli.mas_bottom).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(-LENGTH(85));
        make.height.mas_equalTo(LENGTH(20));
    }];


    longtext = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@",CHANGWENZI,CHANGWENZI,CHANGWENZI,CHANGWENZI,CHANGWENZI,CHANGWENZI,CHANGWENZI,CHANGWENZI,CHANGWENZI,CHANGWENZI]];
    longtext.numberOfLines = 4;
    [self addSubview:longtext];
    
    [longtext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImageView.mas_left).with.offset(0);
        make.top.equalTo(self->leftImageView.mas_bottom).with.offset(LENGTH(30));
        make.right.equalTo(ws).with.offset(-LENGTH(85));
    }];
    
    BaseButton * zhankai = [BaseButton buttonWithType:UIButtonTypeCustom];
    [zhankai addTarget:self action:@selector(zhankai:) forControlEvents:UIControlEventTouchUpInside];
    zhankai.backgroundColor = RANDOMCOLOR;
    [self addSubview:zhankai];
    
    [zhankai mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->longtext.mas_bottom).with.offset(LENGTH(20));
        make.centerX.mas_equalTo(ws);
        make.height.mas_equalTo(LENGTH(50));
        make.width.mas_equalTo(LENGTH(50));
        make.bottom.equalTo(ws).with.offset(-LENGTH(20));

    }];
}

- (void)zhankai:(BaseButton *)button{
    longtext.numberOfLines = 0;
}
@end
