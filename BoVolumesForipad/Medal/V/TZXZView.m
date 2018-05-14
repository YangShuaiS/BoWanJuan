//
//  TZXZView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "TZXZView.h"
#import "BookEight.h"
@implementation TZXZView{
    BaseView * leftView;
    BaseLabel * rightView;
    BookEight * bookEight;
    
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
    leftView = [BaseView new];
    leftView.backgroundColor = RANDOMCOLOR;
    [self addSubview:leftView];
    

    rightView = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:@"挑战勋章"];
    rightView.backgroundColor = RANDOMCOLOR;
    [self addSubview:rightView];
    
    bookEight = [BookEight new];
    [self addSubview:bookEight];
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(self->rightView.mas_left).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->leftView.mas_right).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(LENGTH(250));
    }];
    
    [bookEight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self->leftView);
    }];
}
@end
