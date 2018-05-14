//
//  XinZengXunZhangTableViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "XinZengXunZhangTableViewCell.h"

@implementation XinZengXunZhangTableViewCell{
    FLAnimatedImageView * leftImage;
    BaseLabel * Title;
    BaseLabel * Time;
    BaseLabel * SubTitle;
    BaseView * huo;
    FLAnimatedImageView * xunzhang;
    BaseLabel * xunzhangshu;
    FLAnimatedImageView * rentou;
    BaseLabel * rentoushu;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    leftImage = [FLAnimatedImageView new];
    leftImage.backgroundColor = RANDOMCOLOR;
    [self addSubview:leftImage];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Title];
    
    Time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Time];
    
    SubTitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    [self addSubview:SubTitle];
    
    huo = [BaseView new];
    huo.backgroundColor = RANDOMCOLOR;
    [self addSubview:huo];
    
    xunzhang = [FLAnimatedImageView new];
    xunzhang.backgroundColor = RANDOMCOLOR;
    [self addSubview:xunzhang];
    
    rentou = [FLAnimatedImageView new];
    rentou.backgroundColor = RANDOMCOLOR;
    [self addSubview:rentou];
    
    xunzhangshu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    [self addSubview:xunzhangshu];
    
    rentoushu = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    [self addSubview:rentoushu];
    [self updata];
}

- (void)updata{
    WS(ws);
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(12);
        make.left.equalTo(ws).with.offset(12);
//        make.height.mas_equalTo(150);
        make.width.mas_equalTo(LENGTH(250));
        make.height.equalTo(self->leftImage.mas_width).multipliedBy(0.56);

    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->leftImage.mas_top).with.offset(12);
        make.left.equalTo(self->leftImage.mas_right).with.offset(12);
        make.right.equalTo(self->Time.mas_left).with.offset(-12);
    }];
    
    [Time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(12);
        make.left.equalTo(self->Title.mas_right).with.offset(12);
        make.right.equalTo(ws).with.offset(-20);
    }];
    
    [SubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(12);
        make.left.equalTo(self->leftImage.mas_right).with.offset(12);
        make.right.equalTo(ws).with.offset(-12);
    }];
    
    [huo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->SubTitle.mas_bottom).with.offset(12);
        make.left.equalTo(self->leftImage.mas_right).with.offset(12);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(200);
    }];
    
    [xunzhang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->huo.mas_bottom).with.offset(12);
        make.left.equalTo(self->leftImage.mas_right).with.offset(12);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];
    
    [xunzhangshu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->huo.mas_bottom).with.offset(12);
        make.left.equalTo(self->xunzhang.mas_right).with.offset(6);
        make.width.mas_equalTo(50);
    }];
    
    [rentou mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->huo.mas_bottom).with.offset(12);
        make.left.equalTo(self->xunzhangshu.mas_right).with.offset(12);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];
    
    [rentoushu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->huo.mas_bottom).with.offset(12);
        make.left.equalTo(self->rentou.mas_right).with.offset(6);
        make.width.mas_equalTo(50);
//        make.bottom.equalTo(ws).with.offset(-20);
    }];
    [self layoutIfNeeded];
    if (rentou.frame.size.width>0) {
        if (rentou.frame.origin.y+rentou.frame.size.height>leftImage.frame.origin.y+leftImage.frame.size.height) {
            [rentou mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(ws).with.offset(-20);
            }];
//            [rentou layoutIfNeeded];
        }else{
            [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(ws).with.offset(-20);
            }];
//            [leftImage layoutIfNeeded];
        }
        //        [self layoutSubviews];
    }}
- (void)layoutSubviews{
    [super layoutSubviews];

}
- (void)layoutIfNeeded{
    [super layoutIfNeeded];
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
