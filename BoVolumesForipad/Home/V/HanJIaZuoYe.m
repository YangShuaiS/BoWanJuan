//
//  HanJIaZuoYe.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HanJIaZuoYe.h"
typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
    
} AnimationType;
@implementation HanJIaZuoYe{
    
    FLAnimatedImageView * leftImage;
    BaseLabel * title;
    BaseLabel * rightImage;
    FLAnimatedImageView * userimage;
    NSTimer *timer;

    NSInteger inter;
    NSMutableArray * viewarray;
    NSInteger inters;
    
    BaseView * backView ;
    NSString * str;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        viewarray = [NSMutableArray array];
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    inter = 0;
    backView = [BaseView new];
    backView.backgroundColor = RANDOMCOLOR;
    backView.layer.cornerRadius = LENGTH(10);
    backView.layer.masksToBounds = YES;
    [self addSubview:backView];
    [viewarray addObject:backView];
    //
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"班级\n动态"];
//    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"BDZYJT--GB1-0" size:13.66f] range:NSMakeRange(0, 5)];
//    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:150.0f/255.0f green:164.0f/255.0f blue:213.0f/255.0f alpha:1.0f] range:NSMakeRange(0, 5)];
    
    leftImage = [FLAnimatedImageView new];
    leftImage.backgroundColor = RANDOMCOLOR;
    [backView addSubview:leftImage];
    
    rightImage = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentRight Text:@"2018-05-06"];
    [backView addSubview:rightImage];
    
    userimage = [FLAnimatedImageView new];
    userimage.backgroundColor = RANDOMCOLOR;
    [backView addSubview:userimage];
    
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font14) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    title.numberOfLines = 0;
    
    [backView addSubview:title];
    
    WS(ws);
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(26));
        make.top.equalTo(ws).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(-LENGTH(26));
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->backView.mas_left).with.offset(LENGTH(24));
        make.top.equalTo(self->backView.mas_top).with.offset(LENGTH(8));
        //        make.centerY.mas_equalTo(self->backView.mas_centerY);
        make.height.mas_offset(LENGTH(32));
        make.width.mas_offset(LENGTH(29));
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(-LENGTH(8));
    }];
    
    [rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->backView.mas_right).with.offset(-LENGTH(26));
        //        make.top.equalTo(self->backView.mas_top).with.offset(LENGTH(17));
        make.centerY.mas_equalTo(self->userimage.mas_centerY);
        //        make.height.mas_offset(50);
        //        make.width.mas_offset(50);
        //        make.bottom.equalTo(self->backView.mas_bottom).with.offset(-LENGTH(17));
    }];
    
    [userimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(215));
        make.centerY.mas_equalTo(self->leftImage.mas_centerY);
//        make.top.mas_equalTo(self->backView.mas_bottom);
        make.height.mas_offset(LENGTH(25));
        make.width.mas_offset(LENGTH(25));
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->userimage.mas_right).with.offset(LENGTH(11));
        make.right.equalTo(self->rightImage.mas_left).with.offset(-LENGTH(12));
        make.centerY.mas_equalTo(self->userimage.mas_centerY);
        
    }];
    // 创建定时器
//    NSTimer *timer = [NSTimer timerWithTimeInterval:3.5 target:self selector:@selector(test) userInfo:nil repeats:YES];
//    // 将定时器添加到runloop中，否则定时器不会启动
//    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
//- (void)test{
//    CGRect lastframetouxiang = userimage.frame;
//    CGRect titleframetouxiang = title.frame;
//    CGRect rightImageframelast = rightImage.frame;
//
//    [UIView animateWithDuration:3 animations:^{
//        CGRect frame = self->userimage.frame;
//        frame.origin.y = -self->backView.frame.size.height;
//        self->userimage.frame = frame;
//
//        CGRect titleframe = self->title.frame;
//        titleframe.origin.y = -self->backView.frame.size.height;
//        self->title.frame = titleframe;
//
//        CGRect  rightImageframe= self->rightImage.frame;
//        rightImageframe.origin.y = -self->backView.frame.size.height;
//        self->rightImage.frame = rightImageframe;
//    } completion:^(BOOL finished) {
//        self->userimage.frame = lastframetouxiang;
//        self->title.frame = titleframetouxiang;
//        self->rightImage.frame = rightImageframelast;
//        self->title.text = [NSString stringWithFormat:@"%@%ld",self->title.text,self->inter];
//        self->inter++;
//    }];
//
//}
- (void)layoutSubviews{
    [super layoutSubviews];

}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [timer invalidate];
    timer = nil;
    inters = 0;
    [self fan];
        timer = [NSTimer timerWithTimeInterval:6 target:self selector:@selector(fan) userInfo:nil repeats:YES];
        // 将定时器添加到runloop中，否则定时器不会启动
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

}
- (void)fan{

    title.text = [NSString stringWithFormat:@"asjdasjdlaksj%@",_itemarray[inters]];
    NSString *subtypeString;
    subtypeString = kCATransitionFromTop;
    [self transitionWithType:@"cube" WithSubtype:subtypeString ForView:self];
    if (inters < _itemarray.count-1) {
        inters++;
    }else{
        inters = 0;
    }
}
#pragma CATransition动画实现
/**
 *  动画效果实现
 *
 *  @param type    动画的类型 在开头的枚举中有列举,比如 CurlDown//下翻页,CurlUp//上翻页
 ,FlipFromLeft//左翻转,FlipFromRight//右翻转 等...
 *  @param subtype 动画执行的起始位置,上下左右
 *  @param view    哪个view执行的动画
 */
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view {
    CATransition *animation = [CATransition animation];
    animation.duration = 0.7f;
    animation.type = type;
    if (subtype != nil) {
        animation.subtype = subtype;
    }
//    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    [view.layer addAnimation:animation forKey:@"animation"];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
