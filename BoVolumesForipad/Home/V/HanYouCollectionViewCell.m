//
//  HanYouCollectionViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HanYouCollectionViewCell.h"

@implementation HanYouCollectionViewCell{
    BaseView * backView;
    FLAnimatedImageView * imageView;
    BaseLabel * Title;
    
    BaseView * touxiangview;

}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    backView = [BaseView new];
    backView.backgroundColor = RANDOMCOLOR;
    [self.contentView addSubview:backView];
    
    imageView = [FLAnimatedImageView new];
    imageView.backgroundColor = RANDOMCOLOR;

    [backView addSubview:imageView];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentCenter Text:CHANGWENZI];
    [backView addSubview:Title];
    
    touxiangview = [BaseView new];
    [self.contentView addSubview:touxiangview];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_top).with.offset(0);
        make.left.equalTo(self->backView.mas_left).with.offset(0);
        make.right.equalTo(self->backView.mas_right).with.offset(0);
        make.height.mas_equalTo(self->imageView.mas_width).multipliedBy(1.41);
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).with.offset(LENGTH(12));
        make.left.equalTo(self->backView.mas_left).with.offset(0);
        make.right.equalTo(self->backView.mas_right).with.offset(0);
    }];
    
    [touxiangview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(0);
        make.centerX.mas_equalTo(ws);
//        make.width.mas_equalTo(100);
        make.height.mas_equalTo(25);

    }];
    NSMutableArray * touxiangarray = [NSMutableArray array];
    for (int i = 0 ; i < 4; i++) {
        FLAnimatedImageView * touxiang = [FLAnimatedImageView new];
        touxiang.backgroundColor = RANDOMCOLOR;
        touxiang.layer.cornerRadius = LENGTH(25/2);
        touxiang.layer.masksToBounds = YES;
        [touxiangarray addObject:touxiang];
    }
    FLAnimatedImageView * lastTX;
    for (int i = 0; i < touxiangarray.count; i++) {
        FLAnimatedImageView * view = touxiangarray[i];
        [touxiangview addSubview:view];
        if (!lastTX) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                //                make.left.equalTo(self->scrollView.mas_left).with.offset(0);
                //                make.right.equalTo(self->scrollView.mas_right).with.offset(0);
                make.bottom.equalTo(self->touxiangview.mas_bottom).with.offset(0);
                //                make.top.equalTo(ws.view).with.offset(0);
                make.left.equalTo(self->touxiangview.mas_left).with.offset(0);
                make.width.mas_equalTo(LENGTH(25));
                make.height.mas_equalTo(LENGTH(25));
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self->touxiangview.mas_bottom).with.offset(0);
                make.left.equalTo(lastTX.mas_right).with.offset(LENGTH(10));
                make.width.mas_equalTo(LENGTH(25));
                make.height.mas_equalTo(LENGTH(25));
            }];
        }
        if (i == touxiangarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self->touxiangview.mas_right).with.offset(0);
            }];
        }
        lastTX = view;
    }
    
}
-  (void)color{
    backView.backgroundColor = RANDOMCOLOR;
    imageView.backgroundColor = RANDOMCOLOR;
}
@end
