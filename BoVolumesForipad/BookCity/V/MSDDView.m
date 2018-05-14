//
//  MSDDView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MSDDView.h"

@implementation MSDDView{
    BaseLabel * Title;
    BaseLabel * subtitle;

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
    BaseView * TitleView = [BaseView new];
    TitleView.backgroundColor = RANDOMCOLOR;
    TitleView.layer.masksToBounds = YES;
    TitleView.layer.cornerRadius = LENGTH(10);
    [self addSubview:TitleView];
    
    [TitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(20));
        make.top.equalTo(ws).with.offset(LENGTH(20));
    }];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:@""];
    [TitleView addSubview:Title];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(TitleView.mas_left).with.offset(LENGTH(5));
        make.top.equalTo(TitleView.mas_top).with.offset(LENGTH(5));
        make.bottom.equalTo(TitleView.mas_bottom).with.offset(-LENGTH(5));
        make.right.equalTo(TitleView.mas_right).with.offset(-LENGTH(5));
    }];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:@""];
    subtitle.numberOfLines = 0;
    [self addSubview:subtitle];
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(LENGTH(20));
        make.right.equalTo(ws).with.offset(-LENGTH(20));
        make.top.equalTo(TitleView.mas_bottom).with.offset(LENGTH(20));
        make.bottom.equalTo(ws).with.offset(-LENGTH(20));
    }];
}
- (void)setTitle:(NSString *)title{
    _title = title;
    Title.text = ZHANWEIZI;
    subtitle.text = CHANGWENZI;
}
@end
