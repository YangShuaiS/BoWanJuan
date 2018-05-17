


//
//  FriendViewController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/8.
//  Copyright © 2018年 YS. All rights reserved.
//  好友主页

#import "FriendViewController.h"
#import "FriendTopView.h"
#import "FriendXunZhangTable.h"
#import "ReMenTuiJian.h"
#import "FriendAddXQXZ.h"

@interface FriendViewController ()<NavDelegate,UIScrollViewDelegate>{
    UIScrollView * scrollView;
    NSMutableArray *  viewarray;
    
    ReMenTuiJian * rmtj;//热门推荐
    FriendAddXQXZ * xingquxiaozu;//兴趣小组

}

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self AddView];
    [self ViewLaout];
    // Do any additional setup after loading the view.
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:@"他人主页" RightTitle:@"" NativeStyle:NavStyleGeneral];
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

- (void)AddView{
    viewarray = [NSMutableArray array];

    
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    
    FriendTopView * User = [FriendTopView new];
    [scrollView addSubview:User];
    [viewarray addObject:User];
    
    FriendXunZhangTable * XunZhang = [FriendXunZhangTable new];
    XunZhang.layer.masksToBounds = YES;
    XunZhang.layer.cornerRadius = LENGTH(10);
    XunZhang.itemarray = viewarray;
    [scrollView addSubview:XunZhang];
    [viewarray addObject:XunZhang];
    
    //兴趣小组
    xingquxiaozu = [FriendAddXQXZ new];
    xingquxiaozu.delegate = self;
    xingquxiaozu.layer.masksToBounds = YES;
    xingquxiaozu.layer.cornerRadius = LENGTH(10);
    [viewarray addObject:xingquxiaozu];
    
    //热门推荐
    rmtj = [ReMenTuiJian new];
    rmtj.itemarray = viewarray;
    [viewarray addObject:rmtj];
    
    
}
#pragma mark -------------------- 视图布局
- (void)ViewLaout{
    WS(ws);
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    BaseView * lastview;
    for (int i = 0; i < viewarray.count; i++) {
        BaseView * view = viewarray[i];
        [scrollView addSubview:view];
        if (!lastview) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                //                make.left.equalTo(self->scrollView.mas_left).with.offset(0);
                //                make.right.equalTo(self->scrollView.mas_right).with.offset(0);
                make.top.equalTo(self->scrollView.mas_top).with.offset(LENGTH(35));
                //                make.top.equalTo(ws.view).with.offset(0);
                make.left.equalTo(ws.view).with.offset(LENGTH(50));
                make.right.equalTo(ws.view).with.offset(-LENGTH(50));
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws.view).with.offset(LENGTH(50));
                make.right.equalTo(ws.view).with.offset(-LENGTH(50));
                make.top.equalTo(lastview.mas_bottom).with.offset(LENGTH(14));
            }];
        }
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(-LENGTH(14));
            }];
        }
        lastview = view;
    }
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
