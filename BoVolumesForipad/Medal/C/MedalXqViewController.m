//
//  MedalXqViewController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/8.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "MedalXqViewController.h"
#import "Menu.h"
#import "MedalXQNeiRongViewController.h"
#import "MedalRLHaoYouViewController.h"
@interface MedalXqViewController ()<NavDelegate>

@end

@implementation MedalXqViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BEIJINGCOLOR;
    [self AddNavtion];
    [self AddMenu];
    // Do any additional setup after loading the view.
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:@"勋章详情" RightTitle:@"" NativeStyle:NavStyleGeneral];
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
    
    Menu * homeMenu = [[Menu alloc] init];
    homeMenu.titarray = @[@"详情",@"认领好友"];
    [self.view addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(backImage.mas_bottom).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    MedalXQNeiRongViewController* hotview = [[MedalXQNeiRongViewController alloc] init];
    [self addChildViewController:hotview];
    [childVC addObject:hotview];
    
    MedalRLHaoYouViewController * Familiar = [[MedalRLHaoYouViewController alloc] init];
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
