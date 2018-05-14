//
//  DaTiClick.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "DaTiClick.h"

@implementation DaTiClick

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    FLAnimatedImageView * DuWenZhang = [FLAnimatedImageView new];
    DuWenZhang.backgroundColor = RANDOMCOLOR;
    DuWenZhang.userInteractionEnabled = YES;
    self.userInteractionEnabled = YES;
    [self addSubview:DuWenZhang];
    
    [DuWenZhang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws).with.offset(-20);
        make.top.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(LENGTH(200));
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(100));
    }];
    
    self.button= [BaseButton buttonWithType:UIButtonTypeCustom];
//    [LeftButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [self addSubview:self.button];
    
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(DuWenZhang);
    }];
//    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)];
//    //将手势添加到需要相应的view中去
//    [DuWenZhang addGestureRecognizer:tapGesture1];
    
}

@end
