//
//  FriendXZTableViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendXZTableViewCell.h"
#import "FriendXunZHangView.h"
@implementation FriendXZTableViewCell{
    BaseLabel * LV;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = RANDOMCOLOR;
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    
    LV = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font17) TextAlignment:NSTextAlignmentCenter Text:@"lv999"];
    [self addSubview:LV];
    
    FriendXunZHangView * view = [FriendXunZHangView new];
       view.itemWidths = LENGTH(40);
//    view.backgroundColor = RANDOMCOLOR;
    NSMutableArray * a = [NSMutableArray array];
    for (int i=0; i<60;i++) {
        [a addObject:@"123"];
    }
    view.itemarray = a;
    [self addSubview:view];
    WS(ws);
    
    [LV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.width.mas_equalTo(LENGTH(130));
        make.centerY.mas_equalTo(ws);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(10));
        make.left.equalTo(self->LV.mas_right).with.offset(0);
        make.right.equalTo(ws).with.offset(-LENGTH(10));
        make.bottom.equalTo(ws).with.offset(-LENGTH(10));
        
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
