//
//  MingShiDaoDuViewController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MingShiDaoDuViewController.h"
#import "MingShiDaoDuTableViewCell.h"
@interface MingShiDaoDuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) BaseTableView *tableView;

@end

@implementation MingShiDaoDuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    // Do any additional setup after loading the view.
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[BaseTableView alloc] init];
        _tableView.separatorStyle = UITableViewStylePlain;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.allowsMultipleSelectionDuringEditing = YES;
        
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
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    MingShiDaoDuTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[MingShiDaoDuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.title = CHANGWENZI;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return
//}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
