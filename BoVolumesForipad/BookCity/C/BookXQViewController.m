//
//  BookXQViewController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/9.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "BookXQViewController.h"
#import "BookXQTopView.h"
#import "Menu.h"
#import "MingShiDDViewController.h"
#import "YouXiuSPViewController.h"
#import "UserFriendViewController.h"
@interface BookXQViewController (){
    Menu * homeMenu;
}

@end

@implementation BookXQViewController{
    BookXQTopView * bookTop;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    bookTop = [BookXQTopView new];
    [self.view addSubview:bookTop];
    [bookTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.top.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
    }];
    
    
    BaseButton * LeftButton = [BaseButton buttonWithType:UIButtonTypeCustom];
//    [LeftButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    LeftButton.backgroundColor = RANDOMCOLOR;
    [LeftButton addTarget:self action:@selector(left) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:LeftButton];
    
    [LeftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(12);
        make.top.equalTo(ws.view).with.offset(20+10);
        make.height.mas_equalTo(@18);
        make.width.mas_equalTo(@18);
    }];
    
    switch (_style) {
        case BookIntensiveReading:
            [self addIntensiveMenu];
            break;
        case BookExtensiveReading:
            [self addExtensiveMenu];

            break;
        default:
            break;
    }
    
    [self addDownView];
    
}

- (void)addIntensiveMenu{
    
    WS(ws);
    homeMenu = [[Menu alloc] init];
    homeMenu.titarray = @[@"名师导读",@"优秀书评",@"在读同学"];
    [self.view addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(self->bookTop.mas_bottom).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-TABBARHeight);
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    
    MingShiDDViewController * msdt = [[MingShiDDViewController alloc] init];
    [self addChildViewController:msdt];
    [childVC addObject:msdt];
    
    YouXiuSPViewController * yxsp = [[YouXiuSPViewController alloc] init];
    [self addChildViewController:yxsp];
    [childVC addObject:yxsp];
    
    UserFriendViewController * zdtx = [[UserFriendViewController alloc] init];
    [self addChildViewController:zdtx];
    [childVC addObject:zdtx ];
    
    //
    homeMenu.controllerArray = childVC;
    
}
- (void)addExtensiveMenu{
    WS(ws);
    homeMenu = [[Menu alloc] init];
    homeMenu.titarray = @[@"在读同学"];
    [self.view addSubview:homeMenu];
    [homeMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(self->bookTop.mas_bottom).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(-TABBARHeight);
    }];
    NSMutableArray *childVC = [[NSMutableArray alloc] init];
    UserFriendViewController * hotview = [[UserFriendViewController alloc] init];
    [self addChildViewController:hotview];
    [childVC addObject:hotview];
    
    //
    homeMenu.controllerArray = childVC;
}

- (void)addDownView{
    WS(ws);
    BaseLabel * leftLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:@"挑战答题"];
    leftLabel.backgroundColor = RANDOMCOLOR;
    [self.view addSubview:leftLabel];
    
    BaseLabel * RightLabel = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:@"加入书架"];
    RightLabel.backgroundColor = RANDOMCOLOR;
    [self.view addSubview:RightLabel];
    
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view).with.offset(0);
        make.right.equalTo(RightLabel.mas_left).with.offset(0);
        make.top.equalTo(self->homeMenu.mas_bottom).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
        make.width.mas_equalTo(RightLabel.mas_width);
    }];
    
    [RightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftLabel.mas_right).with.offset(0);
        make.right.equalTo(ws.view).with.offset(0);
        make.top.equalTo(self->homeMenu.mas_bottom).with.offset(0);
        make.bottom.equalTo(ws.view).with.offset(0);
        make.width.mas_equalTo(leftLabel.mas_width);
    }];
    
}
- (void)left{
    [self.navigationController popViewControllerAnimated:YES];
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
