//
//  ShiZiLv.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/15.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ShiZiLv.h"

@implementation ShiZiLv{
    FLAnimatedImageView * imageView;
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
    imageView = [FLAnimatedImageView new];
    imageView.backgroundColor = RANDOMCOLOR;
    [self addSubview:imageView];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:@""];
    [self addSubview:title];
    
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws);
    }];
    
}

- (void)setItemarray:(NSMutableArray *)itemarray{
    imageView.backgroundColor = RANDOMCOLOR;
    title.text = ZHANWEIZI;

}
@end
