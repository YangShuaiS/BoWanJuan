//
//  MedalViewController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalViewController.h"
#import "MedalTableViewCell.h"
#import "MedalXqViewController.h"
#import "XingQuXiaoZuViewController.h"

@interface MedalViewController ()<NavDelegate,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) BaseTableView *tableView;

@end

@implementation MedalViewController{
    NSMutableArray * dataarray;
    NSString * title;
}
- (void)UPDATA{
    switch (_style) {
        case ViewControllerStyleXZXQ:
            title = @"勋章详情";
            break;
        case ViewControllerStyleXQAH:
            title = @"兴趣爱好";
            break;
        default:
            break;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BEIJINGCOLOR;
    [self UPDATA];
    [self AddNavtion];
    WS(ws);
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:title RightTitle:@"" NativeStyle:NavStyleGeneral];
    self.navtive.delegate = self;
    [self.view addSubview:self.navtive];
    [ws.navtive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.height.mas_equalTo(NavHeight);
    }];
    
}
- (void)NavLeftClick{
    [self.navigationController popViewControllerAnimated:YES];
    //    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
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
        
        _tableView.backgroundColor = BEIJINGCOLOR;
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
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * rid = @"cell";
    MedalTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell=[[MedalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
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
    //    NSArray * cellarray = [self cellsForTableView:_tableView];
    //    for (FoundHaoTJTableViewCell * cell in cellarray) {
    //        tableViewHeight = tableViewHeight + cell.frame.size.height;
    //    }
    //    [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
    //        make.height.mas_equalTo(self->tableViewHeight);
    //
    //    }];
    return 10;
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
    switch (_style) {
        case ViewControllerStyleXZXQ:
            [self pushViewControllerXZXQ];
            break;
        case ViewControllerStyleXQAH:
            [self pushViewControllerXQAH];
            break;
        default:
            break;
    }
    

}

- (void)pushViewControllerXZXQ{
    MedalXqViewController * vc = [MedalXqViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)pushViewControllerXQAH{
    XingQuXiaoZuViewController * vc = [XingQuXiaoZuViewController new];
    [self.navigationController pushViewController:vc animated:YES];
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
