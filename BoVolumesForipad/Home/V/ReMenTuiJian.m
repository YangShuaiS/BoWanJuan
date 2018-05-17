//
//  ReMenTuiJian.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ReMenTuiJian.h"
#import "ReMenTuiJianTableViewCell.h"
@interface ReMenTuiJian ()
@end
@implementation ReMenTuiJian{
    BaseLabel * Title;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor = [UIColor whiteColor];

    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font20) TextAlignment:NSTextAlignmentCenter Text:@"在读书籍"];
    [self addSubview:Title];
    WS(ws);

    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(38));
        make.right.equalTo(ws).with.offset(0);
    }];
    [self addSubview:self.tableView];
    self.tableView.scrollEnabled = NO;
    [ws.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->Title.mas_bottom).with.offset(20);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(1000);
    }];}

- (void)layoutSubviews{
    
    [super layoutSubviews];
//    WS(ws);
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            NSArray * cellarray = [self cellsForTableView:ws.tableView];
//            for (ReMenTuiJianTableViewCell * cell in cellarray) {
//                self->tableViewHeight = self->tableViewHeight + cell.frame.size.height;
//            }
//            [ws.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.height.mas_equalTo(self->tableViewHeight);
//
//            }];
//        });

}


#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _itemarray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    ReMenTuiJianTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[ReMenTuiJianTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return
//}

-(NSArray *)cellsForTableView:(UITableView *)tableView
{
    NSInteger sections = tableView.numberOfSections;
    NSMutableArray *cells = [[NSMutableArray alloc]  init];
    for (int section = 0; section < sections; section++) {
        NSInteger rows =  [tableView numberOfRowsInSection:section];
        for (int row = 0; row < rows; row++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
            [cells addObject:[tableView cellForRowAtIndexPath:indexPath]];
        }
    }
    return cells;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return LENGTH(5);
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    return v;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    return v;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [self.tableView reloadData];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self uptableview];
    });
}
- (void)uptableview{
    WS(ws);
    CGFloat tableViewHeight = 0;
    NSArray * cellarray = [self cellsForTableView:ws.tableView];
    for (ReMenTuiJianTableViewCell * cell in cellarray) {
        tableViewHeight = tableViewHeight + cell.frame.size.height;
    }
    [ws.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(tableViewHeight);
        
    }];
}
@end
