//
//  YouXiuSp.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "YouXiuSp.h"

@implementation YouXiuSp{
    BaseLabel * Name;
    BaseLabel * LV;
    BaseLabel * TheClass;
    BaseLabel * subtitle;
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
    Name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:Name];
    
    LV = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:LV];
    
    TheClass = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:TheClass];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:@""];
    subtitle.backgroundColor = RANDOMCOLOR;
    subtitle.numberOfLines = 0;
    [self addSubview:subtitle];
    
    [Name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(20));
        make.top.equalTo(ws).with.offset(LENGTH(20));
    }];
    
    [LV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->Name.mas_right).with.offset(LENGTH(5));
        make.top.equalTo(ws).with.offset(LENGTH(20));
    }];
    
    [TheClass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->LV.mas_right).with.offset(LENGTH(5));
        make.top.equalTo(ws).with.offset(LENGTH(20));
    }];
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(20));
        make.right.equalTo(ws).with.offset(-LENGTH(20));
        make.top.equalTo(self->TheClass.mas_bottom).with.offset(LENGTH(20));
        make.bottom.equalTo(ws).with.offset(-LENGTH(20));
    }];
    
}
- (void)setTitle:(NSString *)title{
    _title = title;
    Name.text = ZHANWEIZI;
    LV.text = @"lv999";
    TheClass.text = ZHANWEIZI;
    subtitle.text = CHANGWENZI;
}
@end
