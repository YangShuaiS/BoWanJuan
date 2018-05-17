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
//    BaseView * downview;
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
//    leftImage.layer.borderWidth = 5;
//    leftImage.layer.borderColor = [UIColor blackColor].CGColor;
//    leftImage.layer.cornerRadius = 10;
//    leftImage.layer.masksToBounds = YES;
    [self addSubview:leftImage];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font17) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:Title];
    
    _jKStarDisplayView = [[JKStarDisplayView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.jKStarDisplayView.redValue = [@"4.3" floatValue];
    [self addSubview:self.jKStarDisplayView];
    
    subtitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:subtitle];
    
    fuwenben = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:@"等级: 99 能力分支: 80"];
    [self addSubview:fuwenben];
    
    

    [self updata];
    [self addYiDu];
    [self addXunZhang];



}
- (void)setBookCase:(BookCaseStyle)bookCase{
    _bookCase = bookCase;
    switch (bookCase) {
        case BookCaseStyleWD:
            
            break;
        case BookCaseStyleYD:
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
        make.right.equalTo(ws).with.offset(-LENGTH(30));
        make.height.mas_equalTo(LENGTH(37));
        make.width.mas_equalTo(LENGTH(30));
        
    }];
}

- (void)addXunZhang{
    UIView * view = [UIView new];
    view.backgroundColor = RANDOMCOLOR;
    view.layer.cornerRadius = LENGTH(18);
    view.layer.masksToBounds = YES;
    [self addSubview:view];
    
    FLAnimatedImageView * imageView = [FLAnimatedImageView new];
    imageView.backgroundColor = RANDOMCOLOR;
    //    leftImage.layer.borderWidth = 5;
    //    leftImage.layer.borderColor = [UIColor blackColor].CGColor;
        imageView.layer.cornerRadius = LENGTH(13);
        imageView.layer.masksToBounds = YES;
    [view addSubview:imageView];
    
    BaseLabel * names = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font12) TextAlignment:NSTextAlignmentCenter Text:@"勋章名"];
    [view addSubview:names];
    
    WS(ws);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->fuwenben.mas_right).with.offset(LENGTH(44));
        make.centerY.mas_equalTo(ws);
        make.width.mas_equalTo(LENGTH(128));
        make.height.mas_equalTo(LENGTH(36));
    }];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_left).with.offset(LENGTH(18));
        make.centerY.mas_equalTo(view.mas_centerY);
        make.width.mas_equalTo(LENGTH(26));
        make.height.mas_equalTo(LENGTH(26));
    }];
    
    [names mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageView.mas_right).with.offset(LENGTH(0));
        make.right.mas_equalTo(view.mas_right).with.offset(LENGTH(0));
        make.centerY.mas_equalTo(view.mas_centerY);
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
        make.top.equalTo(ws).with.offset(LENGTH(27));
        make.left.equalTo(ws).with.offset(LENGTH(24));
        make.width.mas_equalTo(LENGTH(95));
        make.height.mas_equalTo(LENGTH(133));
//        make.height.equalTo(self->leftImage.mas_width).multipliedBy(1.5);
        make.bottom.equalTo(ws).with.offset(-LENGTH(26));
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->leftImage.mas_top).with.offset(LENGTH(7));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
        make.right.equalTo(ws).with.offset(-12);
    }];
    
    [_jKStarDisplayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(15));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
        make.width.mas_equalTo(LENGTH(80));
        make.height.mas_equalTo(LENGTH(14));
        //       make.right.equalTo(ws).with.offset(-12);
    }];
    


    [subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.jKStarDisplayView.mas_bottom).with.offset(LENGTH(24));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
        make.width.mas_equalTo(LENGTH(165));
    }];

    [fuwenben mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->subtitle.mas_bottom).with.offset(LENGTH(24));
        make.left.equalTo(self->leftImage.mas_right).with.offset(LENGTH(27));
        make.width.mas_equalTo(LENGTH(165));
//        make.bottom.equalTo(self->leftImage.mas_bottom).with.offset(LENGTH(0));
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
