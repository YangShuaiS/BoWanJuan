//
//  XunZhangCollectionViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "XunZhangCollectionViewCell.h"

@implementation XunZhangCollectionViewCell{
    FLAnimatedImageView * touxiang;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    WS(ws);
    touxiang = [FLAnimatedImageView new];
    touxiang.backgroundColor = RANDOMCOLOR;
    touxiang.layer.masksToBounds = YES;
    [self addSubview:touxiang];
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
//        make.centerX.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);

//        make.width.mas_equalTo(LENGTH(50));
//        make.height.mas_equalTo(LENGTH(50));
    }];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    touxiang.layer.cornerRadius = touxiang.frame.size.width/2;

}
@end
