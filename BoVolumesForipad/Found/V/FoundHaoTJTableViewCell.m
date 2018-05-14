//
//  FoundHaoTJTableViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundHaoTJTableViewCell.h"
#import "GGWView.h"
@implementation FoundHaoTJTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    WS(ws);
    GGWView * gg = [GGWView new];
    [self addSubview:gg];
    [gg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)layoutSubviews{
    [super layoutSubviews];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
