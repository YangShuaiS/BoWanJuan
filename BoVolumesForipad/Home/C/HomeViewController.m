//
//  HomeViewController.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/26.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HomeViewController.h"
#import "FenLeiView.h"
#import "HanJIaZuoYe.h"
#import "XingQuXiaoZu.h"
#import "XinZengXunZhang.h"
#import "ZhiZiLvView.h"
#import "HaoYouZaiDu.h"
#import "GGWView.h"
#import "ReMenTuiJian.h"

#pragma mark -------- push
#import "WCQRCodeScanningVC.h"
#import "BookCityViewController.h"
#import "MilestoneViewController.h"

#import "MedalViewController.h"
@interface HomeViewController ()<UIScrollViewDelegate>

@end

@implementation HomeViewController{
    NSMutableArray *  viewarray;
    UIScrollView * scrollView;

    BaseView * topview ;//首页头像部分是图
    BaseView * XunZhangView;//勋章视图
    BaseView * lunbotu;//轮播图
    FenLeiView * fenlei;//分类
    HanJIaZuoYe * hanjiazuoye;//寒假左右
    XingQuXiaoZu * xingquxiaozu;//兴趣小组
    XinZengXunZhang * xinZengXunZhang;//新增勋章
    ZhiZiLvView * zhizilv;//shizilv
    HaoYouZaiDu * haoyouzaidu;//好友在读
    GGWView * ggv;//广告位
    ReMenTuiJian * rmtj;//热门推荐
}
- (void)ConfirmTheSize{
    BOOL isIphoneX = KIsiPhoneX;
    UIView *statusBar = STAUBARHEIGHT;
    StatusBar = statusBar.frame.size.height;
    NavHeight = StatusBar+NAVIGATIONHeight;
    TabBarHeight = TABBARHeight;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self ConfirmTheSize];

    [self Addview];
    [self ViewLaout];
    [self AddTopView];
    [self AddXunZhangView];
    [self AddLunBoTuView];
    [self AddFenLei];
    [self AddHanJiaZuoYou];
}
#pragma mark -------------------- 所有底视图
- (void)Addview{
    scrollView = [UIScrollView new];
    scrollView.backgroundColor = BEIJINGCOLOR;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    [self.view addSubview:scrollView];
    
    viewarray = [NSMutableArray array];
    //头像视图
    topview = [BaseView new];
    topview.backgroundColor = MAINCOLOR;
    [viewarray addObject:topview];
    //勋章视图
    XunZhangView = [BaseView new];
    XunZhangView.backgroundColor = RANDOMCOLOR;
    [viewarray addObject:XunZhangView];
    //轮播图
    lunbotu = [BaseView new];
    lunbotu.backgroundColor = RANDOMCOLOR;
    [viewarray addObject:lunbotu];
    //分类
    fenlei = [FenLeiView new];
    fenlei.backgroundColor = RANDOMCOLOR;
    [viewarray addObject:fenlei];
    //寒假作业
    hanjiazuoye = [HanJIaZuoYe new];
    hanjiazuoye.backgroundColor = BEIJINGCOLOR;
    [viewarray addObject:hanjiazuoye];
    //兴趣小组
    xingquxiaozu = [XingQuXiaoZu new];
    xingquxiaozu.backgroundColor = BEIJINGCOLOR;
    xingquxiaozu.delegate = self;
    [viewarray addObject:xingquxiaozu];
    //新增勋章
    xinZengXunZhang = [XinZengXunZhang new];
    xinZengXunZhang.backgroundColor = BEIJINGCOLOR;
    [viewarray addObject:xinZengXunZhang];
    //识字率
    zhizilv = [ZhiZiLvView new];
//    xinZengXunZhang.backgroundColor = BEIJINGCOLOR;
    [viewarray addObject:zhizilv];
    //好友在读
    haoyouzaidu = [HaoYouZaiDu new];
    haoyouzaidu.backgroundColor = BEIJINGCOLOR;
    [viewarray addObject:haoyouzaidu];
    //GGWView广告位？
    ggv = [GGWView new];
    [viewarray addObject:ggv];
    //热门推荐
    rmtj = [ReMenTuiJian new];
    [viewarray addObject:rmtj];
    
}
#pragma mark -------------------- 视图布局
- (void)ViewLaout{
    WS(ws);
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view).with.offset(0);
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
                make.top.equalTo(self->scrollView.mas_top).with.offset(-20);
//                make.top.equalTo(ws.view).with.offset(0);
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
            }];
        }else{
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(ws.view).with.offset(0);
                make.right.equalTo(ws.view).with.offset(0);
                make.top.equalTo(lastview.mas_bottom).with.offset(0);
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
#pragma mark -------------------- 头像视图
- (void)AddTopView{
    //二维码视图
    FLAnimatedImageView * erweima = [FLAnimatedImageView new];
    erweima.backgroundColor = RANDOMCOLOR;
    [topview addSubview:erweima];
    //二维码点击事件
    BaseButton * erweimabutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [erweimabutton addTarget:self action:@selector(erweima) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:erweimabutton];
    //右面 ？？？？？？？？
    FLAnimatedImageView * right = [FLAnimatedImageView new];
    right.backgroundColor = RANDOMCOLOR;
    [topview addSubview:right];
    //右面 ？？？？？？？？点击事件
    BaseButton * rightbutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [rightbutton addTarget:self action:@selector(rightbutton) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:rightbutton];
    //title
    BaseLabel * title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:@"首页"];
    [topview addSubview:title];
    //头像
    FLAnimatedImageView * touxiang = [FLAnimatedImageView new];
    touxiang.backgroundColor = RANDOMCOLOR;
    touxiang.layer.cornerRadius = 30;
    touxiang.layer.masksToBounds = YES;
    [topview addSubview:touxiang];
    //头像点击事件
    BaseButton * touxiangbutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [touxiangbutton addTarget:self action:@selector(touxiangbutton) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:touxiangbutton];
    //名称
    BaseLabel * name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [topview addSubview:name];
    //等级
    BaseLabel * dengji = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [topview addSubview:dengji];
    
    [erweima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->topview.mas_left).with.offset(12);
        make.top.equalTo(self->topview.mas_top).with.offset(StatusBar+12);
        make.height.mas_offset(20);
        make.width.mas_offset(20);
    }];
    
    [erweimabutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->topview.mas_left).with.offset(0);
        make.top.equalTo(self->topview.mas_top).with.offset(StatusBar);
        make.height.mas_offset(50);
        make.width.mas_offset(50);
    }];
    
    [right mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->topview.mas_right).with.offset(-12);
        make.top.equalTo(self->topview.mas_top).with.offset(StatusBar+12);
        make.height.mas_offset(20);
        make.width.mas_offset(20);
    }];
    
    [rightbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->topview.mas_right).with.offset(0);
        make.top.equalTo(self->topview.mas_top).with.offset(StatusBar);
        make.height.mas_offset(50);
        make.width.mas_offset(50);
    }];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->topview.mas_left).with.offset(100);
        make.right.equalTo(self->topview.mas_right).with.offset(-100);
        make.top.equalTo(self->topview.mas_top).with.offset(StatusBar+12);
    }];
    
    [touxiang mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->topview.mas_centerX);
        make.top.equalTo(title.mas_bottom).with.offset(30);
        make.height.mas_offset(60);
        make.width.mas_offset(60);
    }];
    
    [touxiangbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->topview.mas_centerX);
        make.top.equalTo(title.mas_bottom).with.offset(10);
        make.height.mas_offset(100);
        make.width.mas_offset(100);
    }];
    
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->topview.mas_centerX);
        make.top.equalTo(touxiang.mas_bottom).with.offset(10);
        make.width.mas_offset(100);
    }];
    
    [dengji mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self->topview.mas_centerX);
        make.top.equalTo(name.mas_bottom).with.offset(10);
        make.bottom.equalTo(self->topview.mas_bottom).with.offset(-10);
        make.width.mas_offset(100);
    }];

    
}
#pragma  mark --------------------- top视图点击事件
//二维码
- (void)erweima{
    WCQRCodeScanningVC *WCVC = [[WCQRCodeScanningVC alloc] init];
    [self QRCodeScanVC:WCVC];
}

//右边
- (void)rightbutton{
    BookCityViewController * book = [BookCityViewController new];
    [self.navigationController pushViewController:book animated:YES];
}
//头像
- (void)touxiangbutton{
    self.tabBarController.selectedIndex = 3;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --------------------- 勋章视图
- (void)AddXunZhangView{
    BaseView * leftview = [BaseView new];
    leftview.backgroundColor = RANDOMCOLOR;
    [XunZhangView addSubview:leftview];
    BaseView * shuxianview = [BaseView new];
    shuxianview.backgroundColor = RANDOMCOLOR;
    [XunZhangView addSubview:shuxianview];
    BaseView * rightview = [BaseView new];
    rightview.backgroundColor = RANDOMCOLOR;
    [XunZhangView addSubview:rightview];
    
    BaseButton * xunzhangbutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [xunzhangbutton addTarget:self action:@selector(xunzhangbutton) forControlEvents:UIControlEventTouchUpInside];
    [leftview addSubview:xunzhangbutton];
    
    BaseButton * lichengbeibutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [lichengbeibutton addTarget:self action:@selector(lichengbeibutton) forControlEvents:UIControlEventTouchUpInside];
    [rightview addSubview:lichengbeibutton];
    
    //leftname
    BaseLabel * leftname = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [leftview addSubview:leftname];
    //rightname
    BaseLabel * rightname = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentCenter Text:ZHANWEIZI];
    [rightview addSubview:rightname];
    
    //leftimageview
    FLAnimatedImageView * leftimageview = [FLAnimatedImageView new];
    leftimageview.backgroundColor = RANDOMCOLOR;
    [leftview addSubview:leftimageview];
    //ringimageview
    FLAnimatedImageView * ringimageview = [FLAnimatedImageView new];
    ringimageview.backgroundColor = RANDOMCOLOR;
    [rightview addSubview:ringimageview];
    
    [leftview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->XunZhangView.mas_left).with.offset(0);
        make.right.equalTo(rightview.mas_left).with.offset(0);
        make.top.equalTo(self->XunZhangView.mas_top).with.offset(0);
        make.bottom.equalTo(self->XunZhangView.mas_bottom).with.offset(0);
        make.width.mas_equalTo(rightview);
    }];
    
    [rightview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->XunZhangView.mas_right).with.offset(0);
        make.left.equalTo(leftview.mas_right).with.offset(0);
        make.top.equalTo(self->XunZhangView.mas_top).with.offset(0);
        make.bottom.equalTo(self->XunZhangView.mas_bottom).with.offset(0);
    }];
    
    [shuxianview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->XunZhangView.mas_centerX);
        make.top.equalTo(self->XunZhangView.mas_top).with.offset(10);
        make.bottom.equalTo(self->XunZhangView.mas_bottom).with.offset(-10);
        make.width.mas_equalTo(5);
    }];

    [leftname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(leftview.mas_centerX);
        make.top.equalTo(leftview.mas_top).with.offset(10);
    }];

    [rightname mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(rightview.mas_centerX);
        make.top.equalTo(rightview.mas_top).with.offset(10);
    }];
    
    [leftimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(leftview.mas_centerX);
        make.top.equalTo(leftname.mas_bottom).with.offset(5);
        make.bottom.equalTo(leftview.mas_bottom).with.offset(-10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    [ringimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(rightview.mas_centerX);
        make.top.equalTo(rightview.mas_bottom).with.offset(5);
        make.bottom.equalTo(rightview.mas_bottom).with.offset(-10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    [xunzhangbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(leftview);
    }];
    
    [lichengbeibutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(rightview);
    }];
}
#pragma mark --------------------- 勋章视图点击事件
- (void)xunzhangbutton{
    MedalViewController * vc = [MedalViewController new];
    vc.style = ViewControllerStyleXZXQ;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)lichengbeibutton{
    MilestoneViewController * vc = [MilestoneViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark --------------------- 轮播图
- (void)AddLunBoTuView{
    NSArray * imagearray = @[
                   @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524811593782&di=0e6e7b540d252824f75802540704c5cc&imgtype=0&src=http%3A%2F%2Fimg.tupianzj.com%2Fuploads%2Fallimg%2F160629%2F9-160629132943.jpg",
                   @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524811613659&di=cf804c8d0bc7ac2b6149cbdbf1aa9854&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fadaf2edda3cc7cd9dd031fe33201213fb80e91d9.jpg",
                   @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524811625973&di=380f028d2aeccd87f95a9f273a5d4db6&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn%2Fw500h553%2F20180308%2F7b80-fxpwyhv8191258.jpg",
                   @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524811637959&di=d212cd9a0831deb9681cf9bcbff7ef89&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn%2Fw440h323%2F20180308%2F1f13-fxpwyhv8193388.jpg"
                   ];
    //轮播图
    SDCycleScrollView * cycleScrollerView = [SDCycleScrollView new];
    cycleScrollerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollerView.pageControlDotSize = CGSizeMake(20, 20);;
    cycleScrollerView.dotColor = RGBA(0xff, 0x5e, 0x4d, 1); // 自定义分页控件小圆标颜色
    cycleScrollerView.imageURLStringsGroup = imagearray;
    cycleScrollerView.layer.cornerRadius = 10;
    cycleScrollerView.layer.masksToBounds = YES;
    [lunbotu addSubview:cycleScrollerView];
    
    [cycleScrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->lunbotu.mas_right).with.offset(-12);
        make.left.equalTo(self->lunbotu.mas_left).with.offset(12);
        make.top.equalTo(self->lunbotu.mas_top).with.offset(12);
        make.bottom.equalTo(self->lunbotu.mas_bottom).with.offset(-12);
        make.height.equalTo(self->lunbotu.mas_width).multipliedBy(0.4);
    }];

}
#pragma mark --------------------- 分类
- (void)AddFenLei{
    
}
#pragma mark --------------------- 寒假左右

- (void)AddHanJiaZuoYou{
    
}


#pragma mark --------------------- View点击事件代理
- (void)PushFriendViewCOntroller{
    MedalViewController * vc = [MedalViewController new];
    vc.style = ViewControllerStyleXQAH;
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
