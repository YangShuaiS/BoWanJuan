

//
//  BookHeadView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookHeadView.h"
#import "LeiDaTu.h"
@implementation BookHeadView{
    BaseLabel * title;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor = BEIJINGCOLOR;
    WS(ws);
    LeiDaTu * leidatu = [LeiDaTu new];
    [self addSubview:leidatu];
    [leidatu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(42));
        make.centerY.mas_equalTo(ws.mas_centerY);
//        make.top.equalTo(ws).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(148));
        make.height.mas_offset(LENGTH(148));
        }];
    
    BaseLabel * ZJJY = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font17) TextAlignment:NSTextAlignmentLeft Text:@"专家建议"];
    [self addSubview:ZJJY];
    [ZJJY mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leidatu.mas_right).with.offset(LENGTH(22));
        make.top.equalTo(leidatu.mas_top).with.offset(LENGTH(14));
        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(30));
    }];
    
    //
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font17) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    title.numberOfLines = 0;
    [self addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leidatu.mas_right).with.offset(LENGTH(22));
        make.top.equalTo(ZJJY.mas_bottom).with.offset(LENGTH(30));
        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(30));
    }];
    
    BaseButton * xq = [BaseButton buttonWithType:UIButtonTypeCustom];
    [xq addTarget:self action:@selector(XiangQing) forControlEvents:UIControlEventTouchUpInside];
    [xq setTitle:@"查看详情" forState:UIControlStateNormal];
    [xq setTitleColor:RGB(90, 196, 192) forState:UIControlStateNormal];
    xq.titleLabel.font = TextFont(Font16);
    [self addSubview:xq];
    [xq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(ZJJY.mas_centerY);
        make.right.equalTo(ws.mas_right).with.offset(-LENGTH(30));

    }];
    
    
}

- (void)XiangQing{
    
}
@end
