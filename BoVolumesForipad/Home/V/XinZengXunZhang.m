//
//  XinZengXunZhang.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "XinZengXunZhang.h"
#import "XinZengXunZhangTableViewCell.h"
@interface XinZengXunZhang ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) BaseTableView *tableView;

@end
@implementation XinZengXunZhang{
    BaseView * backView;
    BaseLabel * Title;
    BaseLabel * MoreTitle;
    BaseButton * huanyibibutton;
    CGFloat tableViewHeight;
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    backView = [BaseView new];
    backView.backgroundColor = RANDOMCOLOR;
    [self addSubview:backView];
    
    BaseView * xianView = [BaseView new];
    xianView.backgroundColor = RANDOMCOLOR;
    [self addSubview:xianView];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font20) TextAlignment:NSTextAlignmentLeft Text:@"新发勋章"];
    [backView addSubview:Title];
    
    
    MoreTitle = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font16) TextAlignment:NSTextAlignmentLeft Text:@"查看更多"];
    [backView addSubview:MoreTitle];
    
    WS(ws);
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_top).with.offset(LENGTH(32));
        make.left.equalTo(self->backView.mas_left).with.offset(LENGTH(26));
        make.width.mas_equalTo(2);
        make.height.mas_equalTo(17);
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(xianView.mas_left).with.offset(LENGTH(10));
        make.centerY.mas_equalTo(xianView.mas_centerY);
    }];
    
    [MoreTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianView.mas_centerY);
        make.right.equalTo(self->backView.mas_right).with.offset(-LENGTH(27));
    }];
    
    [huanyibibutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_top).with.offset(0);
        make.right.equalTo(self->backView.mas_right).with.offset(0);
        make.left.equalTo(self->MoreTitle.mas_left).with.offset(0);
        make.bottom.equalTo(self->MoreTitle.mas_bottom).with.offset(0);
    }];
    
    [self addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->MoreTitle.mas_bottom).with.offset(20);
        make.left.equalTo(self->backView.mas_left).with.offset(0);
        make.right.equalTo(self->backView.mas_right).with.offset(0);
        make.bottom.equalTo(self->backView.mas_bottom).with.offset(0);
        make.height.mas_equalTo(ws.tableView.contentSize.height);
    }];
    [_tableView reloadData];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self uptableview];
    });

}
- (void)uptableview{
    WS(ws);
    NSArray * cellarray = [self cellsForTableView:ws.tableView];
    for (XinZengXunZhangTableViewCell * cell in cellarray) {
        self->tableViewHeight = self->tableViewHeight + cell.frame.size.height;
    }
    [ws.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self->tableViewHeight);
        
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[BaseTableView alloc] init];
        _tableView.separatorStyle = UITableViewStylePlain;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
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
    return 3;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    XinZengXunZhangTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[XinZengXunZhangTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.itemarray = _itemarray;
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
