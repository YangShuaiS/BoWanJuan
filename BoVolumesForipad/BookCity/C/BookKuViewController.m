//
//  BookKuViewController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/3.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookKuViewController.h"
#import "SearchViewController.h"
#import "WCQRCodeScanningVC.h"
#import "BooStyleView.h"
#import "BookHeadView.h"
@interface BookKuViewController ()<NavDelegate,BooStyleViewDelegate>
@property (strong, nonatomic) BooStyleView *menu;


@end

@implementation BookKuViewController{
    BookHeadView *headView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    WS(ws);
//    [self.view addSubview:self.tableView];

//    headView = [[BaseView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 250)];
    headView = [BookHeadView new];
    [self.view addSubview:headView];
//    _tableView.tableHeaderView = headView;
//    [_tableView.tableHeaderView addSubview:headView];
        [headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(ws.view).with.offset(NavHeight);
            make.left.equalTo(ws.view).with.offset(0);
            make.right.equalTo(ws.view).with.offset(0);
            make.height.mas_equalTo(self->headView.mas_width).multipliedBy(0.267);
        }];
//    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(ws.tableView.tableHeaderView.mas_top).with.offset(0);
//        make.left.equalTo(ws.tableView.tableHeaderView.mas_left).with.offset(0);
//        make.right.equalTo(ws.tableView.tableHeaderView.mas_right).with.offset(0);
//        make.bottom.equalTo(ws.tableView.tableHeaderView.mas_bottom).with.offset(0);
//        make.height.mas_equalTo(150);
//    }];
    _menu = [BooStyleView new];
    _menu.delegete = self;
    [self.view addSubview:_menu];
    
    [_menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->headView.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-TabBarHeight);
    }];
    [self AddNavtion];

//    // Do any additional setup after loading the view.
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:@"收缩" RightTitle:@"" NativeStyle:NacStyleBookCity];
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
    WCQRCodeScanningVC *WCVC = [[WCQRCodeScanningVC alloc] init];
    [self QRCodeScanVC:WCVC];
}

- (void)NavCenterClick {
    SearchViewController * vc = [SearchViewController new];
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:vc];
    //    [self.navigationController pushViewController:vc animated:NO];
    [self presentViewController:navigationController animated:YES completion:^{
        
    }];
}


- (void)NavRightClick {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollFloat:(CGFloat)flo{
    CGFloat headerViewY;

    if (flo>0) {
        headerViewY = -flo + 64;
        if (flo > headView.frame.size.height) {
            headerViewY = -headView.frame.size.height + 64;
        }
    }else{
        headerViewY = NavHeight;
    }
    WS(ws);
    [headView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(headerViewY);

    }];
    [headView layoutIfNeeded];
    [_menu mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.view).with.offset(-TabBarHeight);
    }];
    [_menu layoutIfNeeded];
//    _menu.frame = CGRectMake(_menu.frame.origin.x, CGRectGetMaxY(headView.frame), WIDTH, HEIGHT - CGRectGetMaxY(headView.frame)-TabBarHeight);
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
