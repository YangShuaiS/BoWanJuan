//
//  MedalXQNeiRongViewController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalXQNeiRongViewController.h"
#import "MedalXQTableViewCell.h"
#import "CaiDanTableViewCell.h"
#import "OnlyTitleTableViewCell.h"
#import "ReMenTuiJianTableViewCell.h"
#import "TZXZView.h"

#import "FriendViewController.h"
@interface MedalXQNeiRongViewController ()<UITableViewDelegate,UITableViewDataSource,MedalXQDelegate>
@property (strong, nonatomic) BaseTableView *tableView;

@end

@implementation MedalXQNeiRongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-TABBARHeight);
    }];
    TZXZView * downView = [TZXZView new];
    [self.view addSubview:downView];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.tableView.mas_bottom).with.offset(0);
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
    if (indexPath.section == 0) {
        NSString * rid = @"cell";
        MedalXQTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[MedalXQTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        return cell;
    }else if (indexPath.section == 1 || indexPath.section == 3){
        NSString * rid = @"caidan";
        CaiDanTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[CaiDanTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }else if (indexPath.section == 2){
        NSString * rid = @"caidanneirong";
        OnlyTitleTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
        if(cell==nil){
            cell=[[OnlyTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    NSString * rid = @"rmtjcell";
    ReMenTuiJianTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[ReMenTuiJianTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
- (void)PushFriendViewCOntroller{
    FriendViewController * vc = [FriendViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return
//}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
        return 0;
}

- (NSArray *)cellsForeSectionTableView:(UITableView *)tableView{
    NSInteger sections = tableView.numberOfSections;
    NSMutableArray *cells = [NSMutableArray array];
    for (int section = 0; section < sections; section++) {

//        [cells addObject:[tableView cellForRowAtIndexPath:indexPath]];
    }
    return cells;

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
    if (section == 1 || section == 3) {
        return 0;
    }
    return 10;}

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
