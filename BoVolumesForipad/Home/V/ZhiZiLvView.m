//
//  ZhiZiLvView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ZhiZiLvView.h"
#import "ShiZiLv.h"
@implementation ZhiZiLvView{
    BaseView * backView;
    NSMutableArray * array;
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

    backView = [BaseView new];
    backView.backgroundColor = RANDOMCOLOR;
    [self addSubview:backView];
    
    array = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        ShiZiLv * szl = [ShiZiLv new];
        szl.itemarray = array;
        [backView addSubview:szl];
        [array addObject:szl];
        
        BaseButton * Button = [BaseButton buttonWithType:UIButtonTypeCustom];
        [Button addTarget:self action:@selector(Button:) forControlEvents:UIControlEventTouchUpInside];
        Button.tag = 100+i;
        [szl addSubview:Button];
        
        [Button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(szl);
        }];
    }
    CGFloat padding = LENGTH(30);

    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];

    [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:padding leadSpacing:padding tailSpacing:padding];
    [array mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_top).offset(LENGTH(37));
        make.height.mas_equalTo(140);
        make.bottom.equalTo(self->backView.mas_bottom).offset(-LENGTH(37));
    }];
    
 
}
- (void)Button:(BaseButton *)button{
    NSLog(@"%ld",button.tag);
}
@end
