//
//  BookCityViewController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/3.
//  Copyright © 2018年 YS. All rights reserved.
//  书城

#import "BookCityViewController.h"
#import "SearchViewController.h"
#import "Menu.h"
#import "BookCithXQViewController.h"
@interface BookCityViewController ()<NavDelegate>

@end

@implementation BookCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self AddMenu];
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
    [self.navigationController popViewControllerAnimated:YES];
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

#pragma mark --------------------  Menu
- (void)AddMenu{
    WS(ws);
    Menu * homeMenu = [[Menu alloc] init];
    homeMenu.titarray = @[@"未读书籍",@"已读书籍"];
    homeMenu.style = MenuStyleBKH;
    [self.view addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    BookCithXQViewController* hotview = [[BookCithXQViewController alloc] init];
    hotview.bookCase = BookCaseStyleWD;
    [self addChildViewController:hotview];
    [childVC addObject:hotview];
    
    BookCithXQViewController * Familiar = [[BookCithXQViewController alloc] init];
    Familiar.bookCase = BookCaseStyleYD;
    [self addChildViewController:Familiar];
    [childVC addObject:Familiar];
    //
    homeMenu.controllerArray = childVC;
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
