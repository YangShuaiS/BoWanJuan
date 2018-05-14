//
//  FoundXQXQTableViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundXQXQTableViewCell.h"

@implementation FoundXQXQTableViewCell{
    FLAnimatedImageView * leftImage;
    BaseLabel * Title;
    BaseLabel * SubTitle;
    BaseLabel * Endtitle;
    BaseButton * ComeOn;
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
    
    SubTitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    [self addSubview:SubTitle];
    
    Endtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Endtitle];
    
    ComeOn = [BaseButton buttonWithType:UIButtonTypeCustom];
    [ComeOn setTitle:@"加入" forState:UIControlStateNormal];
    [ComeOn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ComeOn addTarget:self action:@selector(ComeOn) forControlEvents:UIControlEventTouchUpInside];
    ComeOn.layer.borderWidth = 1;
    ComeOn.layer.borderColor = [UIColor blackColor].CGColor;
    ComeOn.layer.cornerRadius = 5;
    ComeOn.layer.masksToBounds = YES;
    [self addSubview:ComeOn];
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
        make.bottom.equalTo(ws).with.offset(-12);

    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(12);
        make.left.equalTo(self->leftImage.mas_right).with.offset(12);
        make.right.equalTo(self->ComeOn.mas_left).with.offset(-12);
    }];
    
    [SubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws).with.offset(0);
        make.left.equalTo(self->leftImage.mas_right).with.offset(12);
        make.right.equalTo(self->ComeOn.mas_left).with.offset(-12);
    }];
    
    [Endtitle mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self->SubTitle.mas_bottom).with.offset(12);
        make.left.equalTo(self->leftImage.mas_right).with.offset(12);
        make.right.equalTo(self->ComeOn.mas_left).with.offset(-12);
        make.bottom.equalTo(ws).with.offset(-12);

    }];
    
    [ComeOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(-12);
    }];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
//    WS(ws);
//    [self addSubview:Endtitle];
//    [Endtitle mas_updateConstraints:^(MASConstraintMaker *make) {
////        make.top.equalTo(self->SubTitle.mas_bottom).with.offset(100);
//
//    }];
}

- (void)ComeOn{
    leftImage.backgroundColor = RANDOMCOLOR;
    
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
