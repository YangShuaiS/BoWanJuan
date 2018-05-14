//
//  RaderView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "RaderView.h"
#import "RadarMapView.h"
#import "RaderMapCompleteView.h"
@implementation RaderView
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    ElementItem *item1 = [[ElementItem alloc]init];
    item1.itemPercent = @[@"0.5",@"0.6",@"0.8",@"0.4",@"0.2",@"0.1"];
    item1.itemColor = [UIColor greenColor];
    item1.itemName = @"基础综合";
    
     RaderMapCompleteView *radar = [[RaderMapCompleteView alloc]initWithRadarElements:@[@"考试次数",@"考试难度",@"练习次数",@"平均得分",@"错误率",@"准确率"] lengthColor:[UIColor colorWithRed:168.0/255.0 green:168.0/255.0 blue:168.0/255.0 alpha:1]];
    [radar addAbilitysWithElements:@[item1]];
    [self addSubview:radar];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
