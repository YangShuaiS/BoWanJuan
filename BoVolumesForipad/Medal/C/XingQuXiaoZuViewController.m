//
//  XingQuXiaoZuViewController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "XingQuXiaoZuViewController.h"
#import "Menu.h"
#import "MdcziXQJSView.h"
#import "FriendViewController.h"
#import "MingShiDaoDuViewController.h"
#import "UserFriendViewController.h"
@interface XingQuXiaoZuViewController ()<NavDelegate>

@end

@implementation XingQuXiaoZuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self AddMenu];
    // Do any additional setup after loading the view.
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:@"兴趣小组详情" RightTitle:@"" NativeStyle:NavStyleGeneral];
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



#pragma mark --------------------  Menu
- (void)AddMenu{
    WS(ws);
    FLAnimatedImageView * backImage = [FLAnimatedImageView new];
    backImage.backgroundColor = RANDOMCOLOR;
    [self.view addSubview:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.height.mas_equalTo(ws.view.mas_width).multipliedBy(0.3125);
    }];
    
    MdcziXQJSView * view = [MdcziXQJSView new];
    view.delegate = self;
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(backImage.mas_bottom).with.offset(0);
    }];
    
    
    Menu * homeMenu = [[Menu alloc] init];
    homeMenu.titarray = @[@"名师导读",@"书籍推荐",@"小组成员"];
    [self.view addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(view.mas_bottom).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-TABBARHeight);
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    MingShiDaoDuViewController* hotview = [[MingShiDaoDuViewController alloc] init];
    [self addChildViewController:hotview];
    [childVC addObject:hotview];
    
    UIViewController * Familiar = [[UIViewController alloc] init];
    [self addChildViewController:Familiar];
    [childVC addObject:Familiar];
    
    UserFriendViewController * xiaozuchengyuan = [[UserFriendViewController alloc] init];
    [self addChildViewController:xiaozuchengyuan];
    [childVC addObject:xiaozuchengyuan];

    //
    homeMenu.controllerArray = childVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)PushFriendViewCOntroller{
    FriendViewController * vc = [FriendViewController new];
    [self.navigationController pushViewController:vc animated:YES];
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
