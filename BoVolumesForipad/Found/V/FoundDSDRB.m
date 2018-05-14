//
//  FoundDSDRB.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundDSDRB.h"

@implementation FoundDSDRB{
    BaseLabel * Title;
    BaseView * backView;
    BaseView * centerview;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    backView = [BaseView new];
    backView.backgroundColor = BEIJINGCOLOR;
    backView.layer.cornerRadius = 10;
    backView.layer.masksToBounds = YES;
    [self addSubview:backView];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:@"读书达人榜"];
    [self addSubview:Title];
    WS(ws);
    
    centerview = [BaseView new];
    centerview.backgroundColor = BEIJINGCOLOR;
    [self addSubview:centerview];

    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(20);
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(-LENGTH(0));
    }];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(40));
        make.left.equalTo(ws).with.offset(LENGTH(80));
        make.right.equalTo(ws).with.offset(-LENGTH(80));
        make.bottom.equalTo(ws).with.offset(-LENGTH(45));
        make.height.mas_equalTo(self->backView.mas_width).multipliedBy(0.391);
    }];
    [centerview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(140));
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(0);
        make.centerX.mas_equalTo(self->backView.mas_centerX);
    }];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint point1 = CGPointMake(centerview.frame.origin.x, centerview.frame.origin.y+LENGTH(20));
    CGPoint point2 = CGPointMake(centerview.frame.origin.x-LENGTH(10), centerview.frame.origin.y+LENGTH(20));
    CGPoint point3 = CGPointMake(centerview.frame.origin.x, centerview.frame.origin.y+LENGTH(120));
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point1];
        CAShapeLayer * animLayer = [CAShapeLayer layer];
        animLayer.path = path.CGPath;
        //            animLayer.fillColor = [UIColor clearColor].CGColor;
        animLayer.lineWidth = 1.f;
        animLayer.strokeColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5].CGColor;
        animLayer.fillColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5].CGColor;
    
        [self.layer addSublayer:animLayer];
    CGFloat path1x = centerview.frame.origin.x + centerview.frame.size.width;
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    CGPoint point11 = CGPointMake(path1x, centerview.frame.origin.y+LENGTH(20));
    CGPoint point22 = CGPointMake(path1x+LENGTH(10), centerview.frame.origin.y+LENGTH(20));
    CGPoint point33 = CGPointMake(path1x, centerview.frame.origin.y+LENGTH(120));
    [path1 moveToPoint:point11];
    [path1 addLineToPoint:point22];
    [path1 addLineToPoint:point33];
    [path1 addLineToPoint:point11];
    CAShapeLayer * animLayer1 = [CAShapeLayer layer];
    animLayer1.path = path1.CGPath;
    //            animLayer.fillColor = [UIColor clearColor].CGColor;
    animLayer1.lineWidth = 1.f;
    animLayer1.strokeColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5].CGColor;
    animLayer1.fillColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5].CGColor;
    
    [self.layer addSublayer:animLayer1];
}
@end
