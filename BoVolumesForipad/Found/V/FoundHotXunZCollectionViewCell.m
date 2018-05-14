//
//  FoundHotXunZCollectionViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundHotXunZCollectionViewCell.h"


@implementation FoundHotXunZCollectionViewCell{
    FLAnimatedImageView * imageView;
    BaseLabel * Title;

}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor = RANDOMCOLOR;
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    
    
    imageView = [FLAnimatedImageView new];
    imageView.backgroundColor = RANDOMCOLOR;
    imageView.layer.cornerRadius = 10;
    imageView.layer.masksToBounds = YES;
    [self addSubview:imageView];
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:CHANGWENZI];
    Title.numberOfLines = 2;
    [self addSubview:Title];
    
    WS(ws);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.mas_equalTo(ws).with.offset(-85);
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->imageView.mas_bottom).with.offset(12);
        make.left.equalTo(ws).with.offset(12);
        make.right.equalTo(ws).with.offset(-12);
    }];


}

- (void)layoutSubviews{
    [super layoutSubviews];
 
}
-  (void)color{
//    self.backgroundColor = RANDOMCOLOR;
}
@end
