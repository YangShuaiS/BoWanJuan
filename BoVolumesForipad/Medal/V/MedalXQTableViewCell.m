//
//  MedalXQTableViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalXQTableViewCell.h"
#import "MdcziXQJSView.h"
@interface MedalXQTableViewCell ()<BaseViewDelegate>

@end
@implementation MedalXQTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
        
    }
    return self;
}
- (void)addview{
    WS(ws);
    MdcziXQJSView * view = [MdcziXQJSView new];
    view.delegate = self;
    [self addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
}
- (void)PushFriendViewCOntroller{
    [self.delegate PushFriendViewCOntroller];

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

    // Configure the view for the selected state
}

@end
