//
//  FoundDSDRB.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundDSDRB.h"
#import "DSDRBUserView.h"
@implementation FoundDSDRB{
    BaseLabel * Title;
    BaseView * backView;
    BaseView * centerview;
    NSMutableArray * array;
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
    backView.layer.cornerRadius = LENGTH(10);
    backView.layer.masksToBounds = YES;
    [self addSubview:backView];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font20) TextAlignment:NSTextAlignmentCenter Text:@"本周勋章排名"];
    [self addSubview:Title];
    WS(ws);
    
    centerview = [BaseView new];
    centerview.backgroundColor = BEIJINGCOLOR;
    [self addSubview:centerview];

    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(37));
        make.left.equalTo(ws).with.offset(LENGTH(0));
        make.right.equalTo(ws).with.offset(-LENGTH(0));
    }];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(50));
        make.left.equalTo(ws).with.offset(LENGTH(98));
        make.right.equalTo(ws).with.offset(-LENGTH(98));
        make.bottom.equalTo(ws).with.offset(-LENGTH(46));
        make.height.mas_equalTo(self->backView.mas_width).multipliedBy(0.345);
    }];
    [centerview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_top).with.offset(-LENGTH(13));
        make.width.mas_equalTo(LENGTH(190));
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(0);
        make.centerX.mas_equalTo(self->backView.mas_centerX);
    }];
    
    array = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        DSDRBUserView * view = [DSDRBUserView new];
        [array addObject:view];
        if (i == 0) {
            [backView addSubview:view];

            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->backView.mas_top).with.offset(0);
                make.bottom.equalTo(self->backView.mas_bottom).with.offset(0);
                make.left.equalTo(self->backView.mas_left).with.offset(0);
                make.right.equalTo(self->centerview.mas_left).with.offset(0);
            }];
        }else if (i == 1){
            [centerview addSubview:view];

            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->centerview.mas_top).with.offset(0);
                make.bottom.equalTo(self->centerview.mas_bottom).with.offset(0);
                make.left.equalTo(self->centerview.mas_left).with.offset(0);
                make.right.equalTo(self->centerview.mas_right).with.offset(0);
            }];
        }else{
            [backView addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self->backView.mas_top).with.offset(LENGTH(5));
                make.bottom.equalTo(self->backView.mas_bottom).with.offset(0);
                make.left.equalTo(self->centerview.mas_right).with.offset(0);
                make.right.equalTo(self->backView.mas_right).with.offset(0);
            }];
        }
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint point1 = CGPointMake(centerview.frame.origin.x, centerview.frame.origin.y+LENGTH(13));
    CGPoint point2 = CGPointMake(centerview.frame.origin.x-LENGTH(10), centerview.frame.origin.y+LENGTH(13));
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
    CGPoint point11 = CGPointMake(path1x, centerview.frame.origin.y+LENGTH(13));
    CGPoint point22 = CGPointMake(path1x+LENGTH(10), centerview.frame.origin.y+LENGTH(13));
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
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    for (DSDRBUserView * view in array) {
        view.itemarray = itemarray;
    }
}
@end
