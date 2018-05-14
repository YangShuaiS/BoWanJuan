//
//  YouXiuSPViewController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/10.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "YouXiuSPViewController.h"
#import "YouXiuSPView.h"
@interface YouXiuSPViewController ()<UIScrollViewDelegate>{
    UIScrollView * scrollView;
}

@end

@implementation YouXiuSPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    
    WS(ws);
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
    }];
    
    YouXiuSPView * MSDD = [YouXiuSPView new];
    MSDD.backgroundColor = [UIColor whiteColor];
    MSDD.layer.masksToBounds = YES;
    MSDD.layer.cornerRadius = 15;
    [self.view addSubview:MSDD];
    
    [MSDD mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(LENGTH(20));
        make.left.equalTo(ws.view).with.offset(LENGTH(20));
        make.right.equalTo(ws.view).with.offset(-LENGTH(20));
        make.bottom.equalTo(ws.view).with.offset(LENGTH(-20));
    }];}

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
