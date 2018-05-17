//
//  BanJiView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BanJiView.h"
@implementation BanJiView{
    BaseView * backView;

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
    [self addSubview:backView];
    
    
    WS(ws);
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.equalTo(self->backView.mas_width).multipliedBy(0.2695);
    }];
   
}
@end
