//
//  MedalRlHaoTableViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalRlHaoTableViewCell.h"
#import "BookEight.h"
@implementation MedalRlHaoTableViewCell{
    FLAnimatedImageView * UserImage;
    BaseLabel * Name;
    BaseLabel * Live;
    BaseView * XunZhang;
    BaseLabel *YDLALL;
    BaseLabel * JFALL;
    BookEight * bookEight;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    WS(ws);
    BaseView * backview = [BaseView new];
    backview.backgroundColor = RANDOMCOLOR;
    [self addSubview:backview];
    [backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(90));
    }];
    
    UserImage = [FLAnimatedImageView new];
    UserImage.backgroundColor = RANDOMCOLOR;
    UserImage.layer.masksToBounds = YES;
    UserImage.layer.cornerRadius = LENGTH(20);
    [backview addSubview:UserImage];
    
    [UserImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(backview.mas_centerY);
        make.left.equalTo(backview.mas_left).with.offset(LENGTH(30));
        make.height.mas_equalTo(LENGTH(40));
        make.width.mas_equalTo(LENGTH(40));
    }];
    
    Name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Name];
    
    Live = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Live];
    
    XunZhang = [BaseView new];
    XunZhang.backgroundColor = RANDOMCOLOR;
    [self addSubview:XunZhang];
    
    BaseLabel * YDL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:@"阅读量："];
    [self addSubview:YDL];
    
    YDLALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:YDLALL];
    
    BaseLabel * JF = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:@"积分："];
    [self addSubview:JF];
    
    JFALL = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:JFALL];
    
    [Name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->UserImage.mas_right).with.offset(LENGTH(10));
        make.top.equalTo(self->UserImage.mas_top).with.offset(0);
    }];
    
    [Live mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->UserImage.mas_right).with.offset(LENGTH(10));
        make.top.equalTo(self->Name.mas_bottom).with.offset(0);
    }];
    
    [XunZhang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->UserImage.mas_right).with.offset(LENGTH(10));
        make.top.equalTo(self->Live.mas_bottom).with.offset(0);
        make.width.mas_equalTo(LENGTH(140));
        make.height.mas_equalTo(LENGTH(20));
    }];
    
    [YDL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(backview.mas_right).with.offset(-LENGTH(85));
        make.top.equalTo(self->Name.mas_top).with.offset(0);
    }];
    
    [YDLALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(backview.mas_right).with.offset(-LENGTH(30));
        make.left.equalTo(YDL.mas_right).with.offset(0);
        make.top.equalTo(self->Name.mas_top).with.offset(0);
    }];
    
    [JF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(backview.mas_right).with.offset(-LENGTH(85));
        make.top.equalTo(YDL.mas_bottom).with.offset(0);
        make.width.mas_equalTo(YDL.mas_width);
    }];
    
    [JFALL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(backview.mas_right).with.offset(-LENGTH(30));
        make.left.equalTo(JF.mas_right).with.offset(0);
        make.top.equalTo(YDL.mas_bottom).with.offset(0);
    }];
    
    bookEight = [BookEight new];
    [self addSubview:bookEight];
    
    [bookEight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->XunZhang.mas_right).with.offset(LENGTH(20));
        make.right.equalTo(YDL.mas_left).with.offset(-LENGTH(20));
        make.centerY.mas_equalTo(backview.mas_centerY);
    }];
    

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
