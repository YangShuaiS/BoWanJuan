//
//  HuoView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/15.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HuoView.h"

@implementation HuoView{
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
    
}
- (void)setInter:(NSInteger)inter{
    _inter = inter;
    array = [NSMutableArray array];
//    [self removeFromSuperview];
    for (int i = 0; i < inter; i++) {
        FLAnimatedImageView * image = [FLAnimatedImageView new];
        image.backgroundColor = RANDOMCOLOR;
        [array addObject:image];
    }
    
    WS(ws);
    FLAnimatedImageView * lastimageview;
    for (int i = 0; i < inter; i++) {
        FLAnimatedImageView * view = array[i];
        [self addSubview:view];

        if (!lastimageview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {

                make.top.equalTo(ws).with.offset(0);
                make.bottom.equalTo(ws).with.offset(0);
                make.right.equalTo(ws).with.offset(0);
                make.width.mas_equalTo(LENGTH(18));
                make.height.mas_equalTo(LENGTH(18));
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(lastimageview.mas_left).with.offset(-LENGTH(5));
                make.centerY.mas_equalTo(lastimageview.mas_centerY);
                make.width.mas_equalTo(LENGTH(18));
                make.height.mas_equalTo(LENGTH(18));
            }];
        }
        if (i == inter-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws).with.offset(0);
            }];
        }
        lastimageview = view;
    }
}
@end
