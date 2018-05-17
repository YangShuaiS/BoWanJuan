//
//  FriendXunZhangTable.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/14.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendXunZhangTable.h"
#import "FriendXZTableViewCell.h"
@interface FriendXunZhangTable ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) BaseTableView *tableView;

@end
@implementation FriendXunZhangTable{
    CGFloat tableViewHeight;

}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    _itemarray = [NSMutableArray array];
    [_itemarray addObject:@"123"];
    [_itemarray addObject:@"123"];
    [_itemarray addObject:@"123"];
    [_itemarray addObject:@"123"];
    [_itemarray addObject:@"123"];
    [_tableView reloadData];
    //求我我就告诉你为什么这么写
    dispatch_async(dispatch_get_main_queue(), ^{
        [self uptableview];
    });
}
- (void)uptableview{
    WS(ws);
    NSArray * cellarray = [self cellsForTableView:ws.tableView];
    for (FriendXZTableViewCell * cell in cellarray) {
        tableViewHeight = tableViewHeight + cell.frame.size.height;
    }
    [ws.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self->tableViewHeight);
        
    }];
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    [self addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(ws.tableView.contentSize.height);
    }];

}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    //求我我就告诉你为什么这么写
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self uptableview];
//    });
//    WS(ws);
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSArray * cellarray = [self cellsForTableView:ws.tableView];
//        for (UITableViewCell * cell in cellarray) {
//            self->tableViewHeight = self->tableViewHeight + cell.frame.size.height;
//        }
//        [ws.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(self->tableViewHeight);
//
//        }];
//    });
    
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[BaseTableView alloc] init];
        _tableView.separatorStyle = UITableViewStyleGrouped;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
        //使tableview无数据时候无下划线
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.estimatedRowHeight = 300;//估算高度
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.scrollEnabled = NO;

    }else{
        [_tableView reloadData];
    }
    return _tableView;
}

#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    FriendXZTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[FriendXZTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return
//}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
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
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * v = [UIView new];
    v.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
    return v;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
@end
