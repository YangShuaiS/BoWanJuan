//
//  FenLeiView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/4/27.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FenLeiView.h"
#import "FenLeiCollectionViewCell.h"
@interface FenLeiView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView; /**< 集合视图 */

@end

@implementation FenLeiView

- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;

}
- (void)layoutSubviews{
    WS(ws);
    self.userInteractionEnabled = YES;
    self.collectionView.userInteractionEnabled = YES;
    [self addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(ws);
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_offset(LENGTH(124));
    }];
}

#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
        return 100;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // item重用机制
    
    FenLeiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{

}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(WIDTH/5,LENGTH(124));
        //定义每个UICollectionView 横向的间距
        flowLayout.minimumLineSpacing = 0;
        //定义每个UICollectionView 纵向的间距
        flowLayout.minimumInteritemSpacing = 0;
        //定义每个UICollectionView 的边距距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//上左下右
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
        
        //注册cell和ReusableView（相当于头部）
        [_collectionView registerClass:[FenLeiCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        //设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        // 设置是否允许滚动
        _collectionView.scrollEnabled = YES;
        //背景颜色
        _collectionView.backgroundColor = [UIColor whiteColor];
        //自适应大小
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.scrollsToTop = NO;

        [self UpCollectionViewHeight];
    }else{
        [self UpCollectionViewHeight];
        
        [_collectionView reloadData];
    }
    return _collectionView;
}
#pragma mark --------------------刷新宽度
- (void)UpCollectionViewHeight{
    
}
@end
