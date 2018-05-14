

//
//  BookHeadView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookHeadView.h"
#import "LeiDaTu.h"
@implementation BookHeadView

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
        make.left.equalTo(ws).with.offset(20);
        make.top.equalTo(ws).with.offset(20);
        make.width.mas_equalTo(200);
                make.height.mas_offset(150);
        }];
    //
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    title.numberOfLines = 2;
    [self addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leidatu.mas_right).with.offset(20);
        make.top.equalTo(leidatu.mas_top).with.offset(20);
        make.right.equalTo(ws.mas_right).with.offset(-20);
    }];
    
    BaseButton * xq = [BaseButton buttonWithType:UIButtonTypeCustom];
    [xq addTarget:self action:@selector(XiangQing) forControlEvents:UIControlEventTouchUpInside];
    [xq setTitle:@"查看详情" forState:UIControlStateNormal];
    [xq setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self addSubview:xq];
    [xq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(title.mas_bottom).with.offset(20);
        make.centerX.mas_equalTo(title.mas_centerX);
    }];
    
    
}

- (void)XiangQing{
    
}
@end
