//
//  MedalTableViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalTableViewCell.h"

@implementation MedalTableViewCell{
    FLAnimatedImageView * backImage;
    BaseLabel * Title;
    BaseLabel * subtitle;

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    backImage = [FLAnimatedImageView new];
    backImage.backgroundColor = RANDOMCOLOR;
    backImage.layer.masksToBounds = YES;
    backImage.layer.cornerRadius = 30;
    [self addSubview:backImage];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    Title.numberOfLines = 2;
    [self addSubview:Title];
    
    FLAnimatedImageView * TXImage = [FLAnimatedImageView new];
    TXImage.backgroundColor = RANDOMCOLOR;
    TXImage.layer.masksToBounds = YES;
    TXImage.layer.cornerRadius = LENGTH(15);
    [self addSubview:TXImage];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:subtitle];
    
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(20);
        make.left.equalTo(ws).with.offset(LENGTH(40));
        make.right.equalTo(ws).with.offset(-LENGTH(40));
        make.height.equalTo(self->backImage.mas_width).multipliedBy(0.34);
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backImage.mas_bottom).with.offset(20);
        make.left.equalTo(self->backImage.mas_left).with.offset(0);
        make.right.equalTo(self->backImage.mas_right).with.offset(0);
    }];
    
    [TXImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(20);
        make.left.equalTo(self->backImage.mas_left).with.offset(0);
        make.width.mas_equalTo(LENGTH(30));
        make.height.mas_equalTo(LENGTH(30));
    }];
    
    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(TXImage.mas_right).with.offset(12);
        make.right.equalTo(ws).with.offset(-20);
        make.centerY.mas_equalTo(TXImage.mas_centerY);
    }];
    
    BaseView * touxiangview = [BaseView new];
//    touxiangview.backgroundColor = RANDOMCOLOR;
    [self addSubview:touxiangview];
    
    [touxiangview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(10);
        make.right.equalTo(ws).with.offset(-40);
        make.height.mas_equalTo(20);
    }];

    NSMutableArray * touxiangarray = [NSMutableArray array];
    NSMutableArray * NameArray = [NSMutableArray array];
    for (int i = 0 ; i < 4; i++) {
        FLAnimatedImageView * touxiang = [FLAnimatedImageView new];
        touxiang.backgroundColor = RANDOMCOLOR;
        touxiang.layer.cornerRadius = 20;
        touxiang.layer.masksToBounds = YES;
        [touxiangarray addObject:touxiang];
        
        BaseLabel * nName = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
        [NameArray addObject:nName];
    }
    
    
    FLAnimatedImageView * lastTX;
    for (int i = 0; i < touxiangarray.count; i++) {
        FLAnimatedImageView * view = touxiangarray[i];
        BaseLabel * name = NameArray[i];
        [touxiangview addSubview:view];
        [touxiangview addSubview:name];

        if (!lastTX) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                //                make.left.equalTo(self->scrollView.mas_left).with.offset(0);
                //                make.right.equalTo(self->scrollView.mas_right).with.offset(0);
//                make.bottom.equalTo(touxiangview.mas_bottom).with.offset(0);
                make.top.equalTo(touxiangview.mas_top).with.offset(0);
                make.left.equalTo(touxiangview.mas_left).with.offset(0);
                make.width.mas_equalTo(40);
                make.height.mas_equalTo(40);
            }];
            
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.bottom.equalTo(touxiangview.mas_bottom).with.offset(0);
                make.top.equalTo(touxiangview.mas_top).with.offset(0);
                make.left.equalTo(lastTX.mas_right).with.offset(10);
                make.width.mas_equalTo(40);
                make.height.mas_equalTo(40);
            }];
        }
        if (i == touxiangarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(touxiangview.mas_right).with.offset(0);
            }];
        }
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.mas_bottom).with.offset(10);
            make.centerX.mas_equalTo(view.mas_centerX);
            make.width.mas_equalTo(view.mas_width);
            make.bottom.equalTo(ws).with.offset(-20);
        }];
        lastTX = view;
    }
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
