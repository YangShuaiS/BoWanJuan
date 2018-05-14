//
//  BookMenuView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/4.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookMenuView.h"

@implementation BookMenuView
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    self.backgroundColor = RGB(225, 233, 233);
    BaseView * oneView = [BaseView new];
    [self addSubview:oneView];
    
    //添加手势
    UITapGestureRecognizer * tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture1)];
    //将手势添加到需要相应的view中去
    [oneView addGestureRecognizer:tapGesture1];
    
    BaseView * centerView = [BaseView new];
    [self addSubview:centerView];
    
    //添加手势
    UITapGestureRecognizer * tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture2)];
    //将手势添加到需要相应的view中去
    [centerView addGestureRecognizer:tapGesture2];
    
    BaseView * rightView = [BaseView new];
    [self addSubview:rightView];
    
    //添加手势
    UITapGestureRecognizer * tapGesture3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture3)];
    //将手势添加到需要相应的view中去
    [rightView addGestureRecognizer:tapGesture3];
    

    [oneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.right.equalTo(centerView.mas_left).with.offset(0);
        make.width.mas_equalTo(centerView.mas_width);
    }];
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(oneView.mas_right).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.right.equalTo(rightView.mas_left).with.offset(0);
        make.width.mas_equalTo(rightView.mas_width);
    }];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerView.mas_right).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
    }];
    BaseLabel * ydfj = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [oneView addSubview:ydfj];

    [ydfj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(oneView);
    }];

    BaseLabel * sjlx = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [centerView addSubview:sjlx];

    [sjlx mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(centerView);

    }];

    BaseLabel * mrpx = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:mrpx];

    [mrpx mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(rightView);
    }];
    
    
    FLAnimatedImageView * oneImage = [FLAnimatedImageView new];
    oneImage.backgroundColor = RANDOMCOLOR;
    [oneView addSubview:oneImage];
    
    FLAnimatedImageView * twoImage = [FLAnimatedImageView new];
    twoImage.backgroundColor = RANDOMCOLOR;
    [centerView addSubview:twoImage];
    
    FLAnimatedImageView * threeImage = [FLAnimatedImageView new];
    threeImage.backgroundColor = RANDOMCOLOR;
    [rightView addSubview:threeImage];
    
    [oneImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ydfj.mas_right).with.offset(5);
        make.centerY.mas_equalTo(ydfj.mas_centerY);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    [twoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sjlx.mas_right).with.offset(5);
        make.centerY.mas_equalTo(sjlx.mas_centerY);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    [threeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(mrpx.mas_right).with.offset(5);
        make.centerY.mas_equalTo(mrpx.mas_centerY);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
}


- (void)tapGesture1{
    [self.delegete BackButtonTitle:@""];

}
- (void)tapGesture2{
    [self.delegete BackButtonTitle:@""];

}
- (void)tapGesture3{
    [self.delegete BackButtonTitle:@""];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
