//
//  BanJiView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BanJiView.h"
@implementation BanJiView{
    BaseView * backView;
    BaseView * paomadeng;
    BaseView * last;
    CGRect lastframe;
    CGRect rect;
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
    
    FLAnimatedImageView * backImage = [FLAnimatedImageView new];
    backImage.backgroundColor = RANDOMCOLOR;
    [backView addSubview:backImage];
    
    BaseLabel * XuXiaoName = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [backImage addSubview:XuXiaoName];
    
    BaseLabel * BanJiName = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [backImage addSubview:BanJiName];
    
    //Add YFRollingLabel
    NSArray *textArray = @[ZHANWEIZI,
                           ZHANWEIZI,
                          ZHANWEIZI,
                           ZHANWEIZI,
                           ZHANWEIZI,
                           ZHANWEIZI,
                           ZHANWEIZI,
                           ZHANWEIZI,
                           ZHANWEIZI,
                           ZHANWEIZI];
    
    paomadeng = [BaseView new];
    [backImage addSubview:paomadeng];
    
    BaseView * allpamadenglabel = [BaseView new];
    [paomadeng addSubview:allpamadenglabel];
    NSMutableArray * labelarray = [NSMutableArray array];
    for (int i = 0 ; i < textArray.count; i++) {
        BaseLabel * pmdlabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:[UIColor redColor] LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
        [labelarray addObject:pmdlabel];
    }

    
    WS(ws);
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(12);
        make.top.equalTo(ws).with.offset(10);
        make.right.equalTo(ws).with.offset(-12);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.equalTo(self->backView.mas_width).multipliedBy(0.325);
    }];
    
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->backView.mas_left).with.offset(0);
        make.top.equalTo(self->backView.mas_top).with.offset(0);
        make.right.equalTo(self->backView.mas_right).with.offset(0);
        make.height.equalTo(self->backView.mas_height).multipliedBy(0.729);
    }];
    
    [XuXiaoName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backImage.mas_left).with.offset(0);
        make.top.equalTo(backImage.mas_top).with.offset(20);
        make.right.equalTo(backImage.mas_right).with.offset(0);
    }];
    
    [BanJiName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backImage.mas_left).with.offset(0);
        make.bottom.equalTo(backImage.mas_bottom).with.offset(-20);
        make.right.equalTo(backImage.mas_right).with.offset(0);
    }];
    
    [paomadeng mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->backView.mas_left).with.offset(0);
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(0);
        make.right.equalTo(self->backView.mas_right).with.offset(0);
        make.height.equalTo(self->backView.mas_height).multipliedBy(0.271);
    }];
    
    [allpamadenglabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->paomadeng.mas_left).with.offset(0);
        make.bottom.equalTo(self->paomadeng.mas_bottom).with.offset(0);
        make.height.equalTo(self->paomadeng.mas_height).multipliedBy(0.271);
    }];
    
    BaseLabel * Lastlabel ;
    for (int i = 0; i < labelarray.count; i++) {
        BaseLabel * label = labelarray[i];
        [allpamadenglabel addSubview:label];
        if (!Lastlabel) {
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                //                make.left.equalTo(self->scrollView.mas_left).with.offset(0);
                //                make.right.equalTo(self->scrollView.mas_right).with.offset(0);
                make.top.equalTo(self->paomadeng.mas_top).with.offset(0);
                //                make.top.equalTo(ws.view).with.offset(0);
                make.left.equalTo(self->paomadeng.mas_left).with.offset(0);
                make.bottom.equalTo(self->paomadeng.mas_bottom).with.offset(0);
                make.width.mas_equalTo(self->paomadeng.mas_width);

            }];
        }else{
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(Lastlabel.mas_right).with.offset(0);
                make.top.equalTo(self->paomadeng.mas_top).with.offset(0);
                make.bottom.equalTo(self->paomadeng.mas_bottom).with.offset(0);
                make.width.mas_equalTo(self->paomadeng.mas_width);


            }];
            if (i == labelarray.count-1) {
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(allpamadenglabel.mas_right).with.offset(0);
                }];
            }
        }
        Lastlabel = label;
        
    }

//    [UIView beginAnimations:@"testAnimation" context:NULL];
//    [UIView setAnimationDuration:8.8f];
//    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//    [UIView setAnimationRepeatCount:999999];
//
//    [allpamadenglabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self->paomadeng.mas_left).with.offset(-1000);
//        make.bottom.equalTo(self->paomadeng.mas_bottom).with.offset(0);
//        make.height.equalTo(self->paomadeng.mas_height).multipliedBy(0.271);
//    }];
//    [Lastlabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(allpamadenglabel.mas_right).with.offset(0);
//    }];
//    [allpamadenglabel layoutIfNeeded];
//    [Lastlabel layoutIfNeeded];
//
//    [UIView commitAnimations];
    last = allpamadenglabel;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appDidEnterPlaygroundNotice) name:UIApplicationDidBecomeActiveNotification object:nil];
}
- (void)UpAnimal{
    CGRect frame = self->last.frame;
    rect = self->last.frame;
    frame.origin.x = 0;
    self->last.frame = frame;
    [UIView animateWithDuration:16.0 delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionRepeat animations:^{
        CGRect frame = self->last.frame;
        frame.origin.x = - self->last.frame.size.width;
        self->last.frame = frame;
    } completion:^(BOOL finished) {
        //            [self donghua2];
    }];
}
- (void)appDidEnterPlaygroundNotice{
    CGRect frame = self->last.frame;
    rect = self->last.frame;
    frame.origin.x = 0;
    self->last.frame = frame;
    [UIView animateWithDuration:16.0 delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionRepeat animations:^{
        CGRect frame = self->last.frame;
        frame.origin.x = - self->last.frame.size.width;
        self->last.frame = frame;
    } completion:^(BOOL finished) {
        //            [self donghua2];
    }];

//    [UIView beginAnimations:@"testAnimation" context:NULL];
//    [UIView setAnimationDuration:8.8f];
//    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//    [UIView setAnimationRepeatCount:999999];
//    CGRect frame = lastframe;
//    frame.origin.x = -1000;
//    last.frame = frame;
//    [UIView commitAnimations];
}
- (void)layoutSubviews{
    lastframe = last.frame;
    [UIView animateWithDuration:16.0 delay:0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionRepeat animations:^{
        CGRect frame = self->last.frame;
            frame.origin.x = - self->last.frame.size.width;
        self->last.frame = frame;
    } completion:^(BOOL finished) {
        //            [self donghua2];
    }];
//    [UIView beginAnimations:@"testAnimation" context:NULL];
//    [UIView setAnimationDuration:8.8f];
//    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//    [UIView setAnimationRepeatCount:999999];
//    CGRect frame = last.frame;
//    frame.origin.x = -1000;
//    last.frame = frame;
//    [UIView commitAnimations];
}
- (void)layoutIfNeeded{
    
}
@end
