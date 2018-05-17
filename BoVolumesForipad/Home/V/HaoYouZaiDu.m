//
//  HaoYouZaiDu.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/28.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "HaoYouZaiDu.h"
#import "HanYouCollectionViewCell.h"
#define itemWidth (WIDTH-LENGTH(36)*4-LENGTH(26)*2)/5
#define itemHeight itemWidth*2.02

@interface HaoYouZaiDu ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView; /**< 集合视图 */

@end
@implementation HaoYouZaiDu{
    BaseView * backView;
    BaseLabel * Title;
    FLAnimatedImageView * shuaxin;
    BaseLabel * huanyihuan;
    BaseButton * huanyibibutton;
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    backView = [BaseView new];
    backView.backgroundColor = RANDOMCOLOR;
    [self addSubview:backView];
    
    BaseView * xianView = [BaseView new];
    xianView.backgroundColor = RANDOMCOLOR;
    [self addSubview:xianView];
    
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font20) TextAlignment:NSTextAlignmentLeft Text:@"好友在读"];
    [backView addSubview:Title];
    
    shuaxin = [FLAnimatedImageView new];
    shuaxin.backgroundColor = RANDOMCOLOR;
    [backView addSubview:shuaxin];
    
    huanyihuan = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font16) TextAlignment:NSTextAlignmentLeft Text:@"换一换"];
    [backView addSubview:huanyihuan];
    
    huanyibibutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [huanyibibutton addTarget:self action:@selector(huanyibibutton) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:huanyibibutton];
    
    
    WS(ws);
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(LENGTH(10));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    
    [xianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_top).with.offset(LENGTH(32));
        make.left.equalTo(self->backView.mas_left).with.offset(LENGTH(26));
        make.width.mas_equalTo(2);
        make.height.mas_equalTo(17);
    }];
    
    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(xianView.mas_left).with.offset(LENGTH(10));
        make.centerY.mas_equalTo(xianView.mas_centerY);
    }];
    
    [huanyihuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianView.mas_centerY);
        make.right.equalTo(self->backView.mas_right).with.offset(-LENGTH(27));
    }];
    
    [shuaxin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(xianView.mas_centerY);
        make.right.equalTo(self->huanyihuan.mas_left).with.offset(-LENGTH(12));
        make.height.mas_equalTo(LENGTH(20));
        make.width.mas_equalTo(LENGTH(20));
    }];
    
    [huanyibibutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->backView.mas_top).with.offset(0);
        make.right.equalTo(self->backView.mas_right).with.offset(0);
        make.left.equalTo(self->huanyihuan.mas_left).with.offset(0);
        make.bottom.equalTo(self->huanyihuan.mas_bottom).with.offset(0);
        
    }];
    
    [backView addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.mas_equalTo(ws);
        make.left.equalTo(self->backView.mas_left).with.offset(0);
        make.top.equalTo(self->Title.mas_bottom).with.offset(LENGTH(20));
        make.right.equalTo(self->backView.mas_right).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_offset(itemHeight);
    }];
}
- (void)layoutSubviews{
    
    
}
- (void)huanyibibutton{
    [_collectionView reloadData];
}

#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // item重用机制
    
    HanYouCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell color];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGSize size = CGSizeMake(itemWidth,itemHeight);
    return size;
}
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
        //定义每个UICollectionView 横向的间距
        flowLayout.minimumLineSpacing = LENGTH(36);
        //定义每个UICollectionView 纵向的间距
        flowLayout.minimumInteritemSpacing = LENGTH(36);
        //定义每个UICollectionView 的边距距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(26), 0, LENGTH(26));//上左下右
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
        
        //注册cell和ReusableView（相当于头部）
        [_collectionView registerClass:[HanYouCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        //设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 设置是否允许滚动
        _collectionView.scrollEnabled = YES;
        //背景颜色
        _collectionView.backgroundColor = [UIColor clearColor];
        //自适应大小
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.scrollsToTop = NO;
        
    }else{
        
        [_collectionView reloadData];
    }
    return _collectionView;
}
@end
