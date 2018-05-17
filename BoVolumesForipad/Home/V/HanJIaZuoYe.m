//
//  HanJIaZuoYe.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HanJIaZuoYe.h"

@implementation HanJIaZuoYe{
    BaseView * backView;
    FLAnimatedImageView * leftImage;
    BaseLabel * title;
    BaseLabel * rightImage;
    FLAnimatedImageView * userimage;

    NSInteger inter;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    inter = 0;
    backView = [BaseView new];
    backView.backgroundColor = RANDOMCOLOR;
    backView.layer.cornerRadius = 10;
    backView.layer.masksToBounds = YES;
    [self addSubview:backView];
    
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
        make.height.mas_offset(32);
        make.width.mas_offset(29);
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
        make.top.mas_equalTo(self->backView.mas_bottom);
        make.height.mas_offset(25);
        make.width.mas_offset(25);
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->userimage.mas_right).with.offset(LENGTH(11));
        make.right.equalTo(self->rightImage.mas_left).with.offset(-12);
        make.centerY.mas_equalTo(self->userimage.mas_centerY);
        
    }];
    [self layoutIfNeeded];
    // 创建定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:3.5 target:self selector:@selector(test) userInfo:nil repeats:YES];
    // 将定时器添加到runloop中，否则定时器不会启动
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
- (void)test{
    CGRect lastframetouxiang = userimage.frame;
    CGRect titleframetouxiang = title.frame;
    CGRect rightImageframelast = rightImage.frame;

    [UIView animateWithDuration:3 animations:^{
        CGRect frame = self->userimage.frame;
        frame.origin.y = -self->backView.frame.size.height;
        self->userimage.frame = frame;
        
        CGRect titleframe = self->title.frame;
        titleframe.origin.y = -self->backView.frame.size.height;
        self->title.frame = titleframe;
        
        CGRect  rightImageframe= self->rightImage.frame;
        rightImageframe.origin.y = -self->backView.frame.size.height;
        self->rightImage.frame = rightImageframe;
    } completion:^(BOOL finished) {
        self->userimage.frame = lastframetouxiang;
        self->title.frame = titleframetouxiang;
        self->rightImage.frame = rightImageframelast;
        self->title.text = [NSString stringWithFormat:@"%@%ld",self->title.text,self->inter];
        self->inter++;
    }];

}
- (void)layoutSubviews{
    [super layoutSubviews];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
