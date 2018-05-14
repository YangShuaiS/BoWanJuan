//
//  ReMenTuiJianTableViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ReMenTuiJianTableViewCell.h"

@implementation ReMenTuiJianTableViewCell{
    FLAnimatedImageView * leftImage;
    BaseLabel * Title;
    BaseLabel * subtitle;
    BaseLabel * fuwenben;
    BaseView * downview;
    FLAnimatedImageView * RightImage;
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
    leftImage.layer.borderWidth = 5;
    leftImage.layer.borderColor = [UIColor blackColor].CGColor;
    leftImage.layer.cornerRadius = 10;
    leftImage.layer.masksToBounds = YES;
    [self addSubview:leftImage];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Title];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:subtitle];
    
    fuwenben = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:fuwenben];
    
    downview = [BaseView new];
    downview.backgroundColor = RANDOMCOLOR;
    [self addSubview:downview];
    

    [self updata];

}
- (void)setBookCase:(BookCaseStyle)bookCase{
    _bookCase = bookCase;
    switch (bookCase) {
        case BookCaseStyleWD:
            [self addWeiDu];
            
            break;
        case BookCaseStyleYD:
            [self addYiDu];
            break;
        case BookCaseStyleHomeWD:
            
            break;
        case BookCaseStyleHomeYD:
            
            break;
        default:
            break;
    }
}
- (void)addYiDu{
    WS(ws);
    RightImage = [FLAnimatedImageView new];
    RightImage.backgroundColor = RANDOMCOLOR;
    [self addSubview:RightImage];
    
    [RightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(-LENGTH(50));
        make.height.mas_equalTo(LENGTH(50));
        make.width.mas_equalTo(LENGTH(50));
        
    }];
}
- (void)addWeiDu{
    WS(ws);

    ComeOn = [BaseButton buttonWithType:UIButtonTypeCustom];
    [ComeOn setTitle:@"未读" forState:UIControlStateNormal];
    [ComeOn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [ComeOn addTarget:self action:@selector(ComeOn) forControlEvents:UIControlEventTouchUpInside];
    ComeOn.layer.borderWidth = 1;
    ComeOn.layer.borderColor = [UIColor blackColor].CGColor;
    ComeOn.layer.cornerRadius = 5;
    ComeOn.layer.masksToBounds = YES;
    [self addSubview:ComeOn];
    
    [ComeOn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(-12);
    }];
}
-(void)ComeOn{
    
}
- (void)updata{
    WS(ws);
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(12);
        make.left.equalTo(ws).with.offset(LENGTH(50));
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(120);
//        make.height.equalTo(self->leftImage.mas_width).multipliedBy(1.5);
        make.bottom.equalTo(ws).with.offset(-12);
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->leftImage.mas_top).with.offset(0);
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(20));
        make.right.equalTo(ws).with.offset(-12);
    }];

    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(20);
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(20));
        make.right.equalTo(ws).with.offset(-12);
    }];

    [fuwenben mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(20);
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(20));
        make.right.equalTo(ws).with.offset(-12);
    }];

    [downview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->fuwenben.mas_bottom).with.offset(0);
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(20));
        make.width.mas_equalTo(LENGTH(180));
        make.bottom.equalTo(self->leftImage.mas_bottom).with.offset(LENGTH(0));
        make.height.mas_equalTo(LENGTH(20));
//       make.right.equalTo(ws).with.offset(-12);
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
