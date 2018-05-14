//
//  BookEight.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookEight.h"

@implementation BookEight{
    NSMutableArray * ImageArray;
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
    
    ImageArray = [NSMutableArray array];
    for (int i = 0; i<8; i++) {
        FLAnimatedImageView * imageView = [FLAnimatedImageView new];
        imageView.backgroundColor = RANDOMCOLOR;
        [self addSubview:imageView];
        [ImageArray addObject:imageView];
    }
    //水平方向宽度固定等间隔
    [ImageArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:LENGTH(30) leadSpacing:10 tailSpacing:10];
    [ImageArray mas_makeConstraints:^(MASConstraintMaker *make) { //数组额你不必须都是view
        make.height.mas_equalTo(LENGTH(20));
        make.width.mas_equalTo(LENGTH(30));
        make.centerY.mas_equalTo(ws);
    }];
    
//    水平方向控件间隔固定等间隔
//    [ImageArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:LENGTH(15) leadSpacing:LENGTH(15) tailSpacing:LENGTH(15)];
//    [ImageArray mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(LENGTH(20));
//        make.width.mas_equalTo(LENGTH(30));
//        make.centerY.mas_equalTo(ws);
//
//    }];
//
}

@end
