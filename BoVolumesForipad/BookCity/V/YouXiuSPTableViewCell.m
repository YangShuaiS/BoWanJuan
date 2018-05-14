//
//  YouXiuSPTableViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "YouXiuSPTableViewCell.h"
#import "YouXiuSp.h"
@implementation YouXiuSPTableViewCell{
    YouXiuSp * msdd;
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
    msdd = [YouXiuSp new];
    [self addSubview:msdd];
    [msdd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
}
- (void)setTitle:(NSString *)title{
    _title = title;
    msdd.title = title;
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
