//
//  FoundHaoEnTuiJian.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundHaoEnTuiJian.h"
#import "FoundHaoTJTableViewCell.h"
@interface FoundHaoEnTuiJian ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) BaseTableView *tableView;

@end
@implementation FoundHaoEnTuiJian{
    MenuNav * menuNav;
    CGFloat tableViewHeight;

}
-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    menuNav = [MenuNav new];
    menuNav.titles = @"你的同学";
    menuNav.menuNavStyle = MenuNavStyleTitle;
    [self addSubview:menuNav];
    
    
    [menuNav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        
    }];
    
    [self addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->menuNav.mas_bottom).with.offset(LENGTH(10));
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_equalTo(1000);
    }];
//    [_tableView reloadData];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSArray * cellarray = [self cellsForTableView:ws.tableView];
//        for (FoundHaoTJTableViewCell * cell in cellarray) {
//            self->tableViewHeight = self->tableViewHeight + cell.frame.size.height;
//        }
//        [ws.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(self->tableViewHeight);
//            
//        }];
//        
//    });

}

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [_tableView reloadData];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self layoutSubviews];
    });
//    WS(ws);
//    CGFloat tableViewHeight = 0;
//            NSArray * cellarray = [self cellsForTableView:ws.tableView];
//            for (FoundHaoTJTableViewCell * cell in cellarray) {
//                tableViewHeight = tableViewHeight + cell.frame.size.height;
//            }
//            [ws.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.height.mas_equalTo(tableViewHeight);
//
//            }];

}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[BaseTableView alloc] init];
        _tableView.separatorStyle = UITableViewStylePlain;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = RGB(0xf8, 0xf8, 0xf8);
        //使tableview无数据时候无下划线
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.estimatedRowHeight = 300;//估算高度
        _tableView.rowHeight = UITableViewAutomaticDimension;
        
    }else{
        [_tableView reloadData];
    }
    return _tableView;
}
#pragma mark  - tableViewDelegate代理方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _itemarray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    FoundHaoTJTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[FoundHaoTJTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
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

- (void)layoutSubviews{
    [super layoutSubviews];
    WS(ws);
        CGFloat tableViewHeight = 0;
            NSArray * cellarray = [self cellsForTableView:ws.tableView];
               for (FoundHaoTJTableViewCell * cell in cellarray) {
                    tableViewHeight = tableViewHeight + cell.frame.size.height;
                }
            [ws.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(tableViewHeight);
    
                }];
}
@end
