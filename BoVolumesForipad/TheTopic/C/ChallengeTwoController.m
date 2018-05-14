//
//  ChallengeTwoController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/7.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "ChallengeTwoController.h"
#import "BookCityViewController.h"
#import "ReadTheArticle.h"
#import "DaTiClick.h"
@interface ChallengeTwoController ()<NavDelegate,UIScrollViewDelegate>

@end

@implementation ChallengeTwoController{
    UIScrollView * scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNavtion];
    [self AddView];

    // Do any additional setup after loading the view.
}
#pragma mark --------------------  导航栏以及代理
- (void)AddNavtion{
    [super AddNavtion];
    WS(ws);
    self.navtive = [[NativeView alloc] initWithLeftImage:@"home-Click" Title:@"阅读文章" RightTitle:@"" NativeStyle:NavStyleGeneral];
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
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[BookCityViewController class]]) {
            BookCityViewController *A =(BookCityViewController *)controller;
            [self.navigationController popToViewController:A animated:YES];
        }
    }
    
    //    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)NavCenterClick {
    
}


- (void)NavRightClick {
    
}



- (void)AddView{
    WS(ws);
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.navtive.mas_bottom).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
        
    }];
    
    FLAnimatedImageView * backImage = [FLAnimatedImageView new];
    backImage.backgroundColor = RANDOMCOLOR;
    [scrollView addSubview:backImage];

    
    ReadTheArticle * read = [ReadTheArticle new];
    [scrollView addSubview:read];
    [read mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(20);
        make.right.equalTo(ws.view).with.offset(-20);
        make.top.equalTo(self->scrollView.mas_top).with.offset(0);
    }];
    
    DaTiClick * click = [DaTiClick new];
    [scrollView addSubview:click];
    [click mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(read.mas_bottom).with.offset(20);
        make.centerX.mas_equalTo(ws.view);
        make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);

    }];
    [click.button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];

    
    
        [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ws.view).with.offset(0);
            make.right.equalTo(ws.view).with.offset(0);
            make.top.equalTo(self->scrollView.mas_top).with.offset(0);
            make.bottom.equalTo(self->scrollView.mas_bottom).with.offset(0);
        }];
    
}
- (void)button{
    
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
