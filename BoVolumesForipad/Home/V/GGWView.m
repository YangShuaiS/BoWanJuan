//
//  GGWView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "GGWView.h"

@implementation GGWView{
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
    backView.layer.cornerRadius = 10;
    backView.layer.masksToBounds = YES;
    [self addSubview:backView];
    
    WS(ws);
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(12);
        make.top.equalTo(ws).with.offset(12);
        make.right.equalTo(ws).with.offset(-12);
        make.bottom.equalTo(ws).with.offset(-12);
        make.height.mas_equalTo(self->backView.mas_width).multipliedBy(0.421);
    }];
}
- (void)layoutSubviews{
    [super layoutSubviews];

}
@end
