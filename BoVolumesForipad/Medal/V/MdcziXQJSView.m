//
//  MdcziXQJSView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MdcziXQJSView.h"
#import "TouXiangView.h"
@implementation MdcziXQJSView{
    BaseLabel * Title;
    BaseLabel * subtitle;
    TouXiangView * touxiang;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{

    WS(ws);
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    Title.numberOfLines = 0;
    [self addSubview:Title];
    
    FLAnimatedImageView * TXImage = [FLAnimatedImageView new];
    TXImage.backgroundColor = RANDOMCOLOR;
    TXImage.layer.masksToBounds = YES;
    TXImage.layer.cornerRadius = LENGTH(15);
    [self addSubview:TXImage];
    
    
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:subtitle];
    
    
    touxiang = [TouXiangView new];
    touxiang.delegate = self;
    [self addSubview:touxiang];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(20);
        make.left.equalTo(ws).with.offset(20);
        make.right.equalTo(ws).with.offset(-20);
    }];
    
    [TXImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self->touxiang.mas_centerY);
        
        //        make.top.equalTo(self->Title.mas_bottom).with.offset(20);
        make.left.equalTo(self->Title.mas_left).with.offset(0);
        make.width.mas_equalTo(LENGTH(30));
        make.height.mas_equalTo(LENGTH(30));
        
    }];
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(TXImage.mas_right).with.offset(12);
        make.right.equalTo(ws).with.offset(-20);
        make.centerY.mas_equalTo(TXImage.mas_centerY);
        
    }];
    
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(20);
        make.right.equalTo(ws).with.offset(-20);
        make.bottom.equalTo(ws).with.offset(-20);
    }];
}

- (void)PushFriendViewCOntroller{
    [self.delegate PushFriendViewCOntroller];
}
@end
