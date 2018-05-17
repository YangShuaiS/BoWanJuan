//
//  DCCycleScrollViewCell.m
//  DCCycleScrollView
//
//  Created by cheyr on 2018/2/27.
//  Copyright © 2018年 cheyr. All rights reserved.
//

#import "DCCycleScrollViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import "FriendTouXIangView.h"
@interface DCCycleScrollViewCell()

@end

@implementation DCCycleScrollViewCell{
    BaseLabel * title;
    BaseLabel * name;
    BaseLabel * zaidu;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        UIView * view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        view.frame = self.bounds;
        view.layer.cornerRadius = LENGTH(5);
        view.layer.borderWidth = 1;
        view.layer.borderColor = [UIColor blackColor].CGColor;
//        view.layer.backgroundColor = [[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f] CGColor];
//        view.alpha = 1;
        [self.contentView addSubview:view];
//
        [view addSubview:self.imageView];
        
        title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font20) TextAlignment:NSTextAlignmentLeft Text:@"书名"];
        [self addSubview:title];
        
        name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font12) TextAlignment:NSTextAlignmentLeft Text:@"名字"];
        [self addSubview:name];
        
        zaidu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font13) TextAlignment:NSTextAlignmentLeft Text:@"9999积分"];
        [self addSubview:zaidu];
        
        
        
        _imageView.backgroundColor = RANDOMCOLOR;
        WS(ws);
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(view.mas_left).with.offset(LENGTH(39));
            make.top.mas_equalTo(view.mas_top).with.offset(LENGTH(44));
            make.bottom.mas_equalTo(view.mas_bottom).with.offset(-LENGTH(44));
            make.width.mas_equalTo(LENGTH(96));
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(ws.imageView.mas_top).with.offset(LENGTH(6));
            make.left.mas_equalTo(ws.imageView.mas_right).with.offset(LENGTH(25));
        }];
        
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self->title.mas_bottom).with.offset(LENGTH(3));
            make.left.mas_equalTo(ws.imageView.mas_right).with.offset(LENGTH(25));
        }];
        
        [zaidu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(view.mas_top).with.offset(LENGTH(50));
            make.right.mas_equalTo(view.mas_right).with.offset(-LENGTH(42));
        }];
        
        
        FriendTouXIangView * touxiang = [FriendTouXIangView new];
        //    view.backgroundColor = RANDOMCOLOR;
        NSMutableArray * a = [NSMutableArray array];
        for (int i=0; i<60;i++) {
            [a addObject:@"123"];
        }
        touxiang.itemarray = a;
        [self addSubview:touxiang];
        
        [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ws.imageView.mas_right).with.offset(LENGTH(25));
            make.right.equalTo(view.mas_right).with.offset(-LENGTH(43));
            make.bottom.equalTo(ws.imageView.mas_bottom).with.offset(-LENGTH(2));
        }];
        
        
        
        
//        self.imageView.frame = view.frame;
//        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.imageView.bounds cornerRadius:self.imgCornerRadius];
//        CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
//        //设置大小
//        maskLayer.frame = self.bounds;
//        //设置图形样子
//        maskLayer.path = maskPath.CGPath;
//        view.layer.mask = maskLayer;
    }
    return self;
}

-(UIImageView *)imageView
{
    if(_imageView == nil)
    {
        _imageView = [[UIImageView alloc]init];
    }
    return _imageView;
}
@end
