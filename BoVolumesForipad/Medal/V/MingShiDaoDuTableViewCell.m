//
//  MingShiDaoDuTableViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MingShiDaoDuTableViewCell.h"

@implementation MingShiDaoDuTableViewCell{
    FLAnimatedImageView * LeftImageView;
    BaseLabel * titles;
    BaseLabel * Title;
    BaseLabel * name;
    BaseLabel * time;

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
    
    LeftImageView = [FLAnimatedImageView new];
    LeftImageView.backgroundColor = RANDOMCOLOR;
    [self addSubview:LeftImageView];
    
    [LeftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(20));
        make.left.equalTo(ws).with.offset(LENGTH(20));
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(150);
    }];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Title];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(20));
        make.left.equalTo(self->LeftImageView.mas_right).with.offset(LENGTH(20));
        make.right.equalTo(ws).with.offset(LENGTH(-20));
    }];
    
    name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:name];
    
    time = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:time];
    
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(10));
        make.left.equalTo(self->LeftImageView.mas_right).with.offset(LENGTH(20));
        make.right.equalTo(self->time.mas_left).with.offset(LENGTH(-20));
    }];
    

    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(10));
        make.left.equalTo(self->name.mas_right).with.offset(LENGTH(20));
        make.right.equalTo(ws).with.offset(LENGTH(-20));
    }];
    
    titles = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    titles.numberOfLines = 0;
    [self addSubview:titles];
    
    [titles mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->time.mas_bottom).with.offset(LENGTH(20));
        make.bottom.equalTo(ws).with.offset(-LENGTH(20));
        make.left.equalTo(self->LeftImageView.mas_right).with.offset(LENGTH(20));
        make.right.equalTo(ws).with.offset(LENGTH(-20));
    }];
    
}
- (void)setTitle:(NSString *)title{
    _title = title;
    titles.text = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@",title,title,title,title,title,title,title,title,title,title
                   ];
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
