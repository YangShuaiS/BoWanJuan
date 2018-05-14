//
//  CaiDanTableViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "CaiDanTableViewCell.h"

@implementation CaiDanTableViewCell{
    BaseLabel * title;
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
    title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    title.backgroundColor = [UIColor redColor];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(LENGTH(40));

    }];
}
- (void)layoutSubviews{
    [super layoutSubviews];

    
    CGRect frame = title.frame;
    frame.size.width = title.frame.size.width+LENGTH(30);
    title.frame = frame;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:title.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(LENGTH(20), LENGTH(20))];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = title.bounds;
    maskLayer.path = maskPath.CGPath;
    title.layer.mask  = maskLayer;
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
