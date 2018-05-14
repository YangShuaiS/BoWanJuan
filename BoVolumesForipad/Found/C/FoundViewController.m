//
//  FoundViewController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundViewController.h"
#import "BanJiView.h"
#import "FoundHotXunZhang.h"
#import "FoundXQXZ.h"
#import "FoundDSDRB.h"
#import "FoundHaoEnTuiJian.h"
@interface FoundViewController ()<NavDelegate,UIScrollViewDelegate>{
    BanJiView * bjview;
}

@end

@implementation FoundViewController{
    UIScrollView * scrollView;
    NSMutableArray *  viewarray;
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [bjview UpAnimal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self Addview];
    [self ViewLaout];
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:@"发现" RightTitle:@"home-Click" NativeStyle:NacStyleFound];
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
    MJExtensionLog(@"点击我了");
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}

#pragma mark -------------------- 所有底视图
- (void)Addview{
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    
    viewarray = [NSMutableArray array];
    
    bjview = [BanJiView new];
    [viewarray addObject:bjview];
    
    FoundHotXunZhang * xunzhang = [FoundHotXunZhang new];
    [viewarray addObject:xunzhang];
    
    FoundXQXZ * xqxq = [FoundXQXZ new];
    [viewarray addObject:xqxq];

    FoundDSDRB * sdrb = [FoundDSDRB new];
    [viewarray addObject:sdrb];
    
    FoundHaoEnTuiJian * fpund = [FoundHaoEnTuiJian new];
    [viewarray addObject:fpund];
    
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
                make.top.equalTo(self->scrollView.mas_top).with.offset(0);
                //                make.top.equalTo(ws.view).with.offset(0);
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
                make.top.equalTo(lastview.mas_bottom).with.offset(5);
            }];
        }
        if (i == viewarray.count-1) {
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(-100);
            }];
        }
        lastview = view;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
