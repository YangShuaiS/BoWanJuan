//
//  FriendTopView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendTopView.h"

@implementation FriendTopView{
    FLAnimatedImageView * UserImage;
    BaseLabel * Name;
    BaseLabel * LV;
    BaseLabel * JFALL;//积分
    BaseLabel * YDLALL;//阅读量
    BaseLabel * BJPMALL;//班级排名
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    
    BaseView * backView = [BaseView new];
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = LENGTH(10);
    [self addSubview:backView];
    
    UserImage  = [FLAnimatedImageView new];
    UserImage.backgroundColor = RANDOMCOLOR;
    UserImage.layer.masksToBounds = YES;
    UserImage.layer.cornerRadius = LENGTH(45);
    [self addSubview:UserImage];
    
    Name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(25) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [backView addSubview:Name];
    
    BaseLabel * LVALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@"等级"];
    [backView addSubview:LVALL];
    
    LV = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@"lv999"];
    [backView addSubview:LV];
    
    BaseLabel * JF = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@"积分"];
    [backView addSubview:JF];
    
    JFALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@"999"];
    [backView addSubview:JFALL];
    
    BaseLabel * YDL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@"阅读量"];
    [backView addSubview:YDL];
    
    YDLALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@"999"];
    [backView addSubview:YDLALL];
    
    BaseLabel * BJPM = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(19) TextAlignment:NSTextAlignmentCenter Text:@"班级排名"];
    [backView addSubview:BJPM];
    
    BJPMALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:@"999"];
    [backView addSubview:BJPMALL];
    
    
    
    WS(ws);
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(45));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    [UserImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_top).with.offset(-LENGTH(45));
        make.centerX.mas_equalTo(backView.mas_centerX);
        make.width.mas_equalTo(LENGTH(90));
        make.height.mas_equalTo(LENGTH(90));

    }];
    
    [Name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(backView.mas_centerX);
        make.top.equalTo(self->UserImage.mas_bottom).with.offset(LENGTH(17));
    }];
    
    [LVALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(backView.mas_left).with.offset(0);
        make.right.mas_equalTo(JF.mas_left).with.offset(0);
        make.top.mas_equalTo(self->Name.mas_bottom).with.offset(LENGTH(44));
        make.width.mas_equalTo(JF.mas_width);
        
    }];
    
    [LV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(LVALL.mas_bottom).with.offset(LENGTH(14));
        make.centerX.mas_equalTo(LVALL.mas_centerX);
        make.width.mas_equalTo(LVALL.mas_width);
    }];
    
    [JF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(LVALL.mas_right).with.offset(0);
        make.right.mas_equalTo(YDL.mas_left).with.offset(0);
        make.top.mas_equalTo(self->Name.mas_bottom).with.offset(LENGTH(44));
        make.width.mas_equalTo(YDL.mas_width);
    }];
    
    [JFALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(JF.mas_bottom).with.offset(LENGTH(14));
        make.centerX.mas_equalTo(JF.mas_centerX);
        make.width.mas_equalTo(JF.mas_width);
    }];

    [YDL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(JF.mas_right).with.offset(0);
        make.right.mas_equalTo(BJPM.mas_left).with.offset(0);
        make.top.mas_equalTo(self->Name.mas_bottom).with.offset(LENGTH(44));
        make.width.mas_equalTo(BJPM.mas_width);
    }];

    [YDLALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(YDL.mas_bottom).with.offset(LENGTH(14));
        make.centerX.mas_equalTo(YDL.mas_centerX);
        make.width.mas_equalTo(YDL.mas_width);
    }];
    
    [BJPM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(YDL.mas_right).with.offset(0);
        make.right.mas_equalTo(backView.mas_right).with.offset(0);
        make.top.mas_equalTo(self->Name.mas_bottom).with.offset(LENGTH(44));
        make.width.mas_equalTo(YDL.mas_width);

    }];
    
    [BJPMALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(BJPM.mas_bottom).with.offset(LENGTH(14));
        make.centerX.mas_equalTo(BJPM.mas_centerX);
        make.width.mas_equalTo(BJPM.mas_width);
        make.bottom.equalTo(backView.mas_bottom).with.offset(-LENGTH(30));
    }];
}

@end
