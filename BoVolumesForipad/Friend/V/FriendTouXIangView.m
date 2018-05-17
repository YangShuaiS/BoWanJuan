
//
//  FriendTouXIangView.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/17.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FriendTouXIangView.h"
#import "XunZhangCollectionViewCell.h"
#define itemWidth LENGTH(46)
#define itemHeight LENGTH(46)

@interface FriendTouXIangView ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView; /**< 集合视图 */
@end
@implementation FriendTouXIangView
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    WS(ws);
    [self addSubview:self.collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.left.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
        make.height.mas_offset(itemHeight);
    }];
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    
}
#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _itemarray.count;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // item重用机制
    
    XunZhangCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
    
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    [self.delegate PushFriendViewCOntroller];
    
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
        //定义每个UICollectionView 横向的间距
        flowLayout.minimumLineSpacing = LENGTH(9);
        //定义每个UICollectionView 纵向的间距
        flowLayout.minimumInteritemSpacing = LENGTH(9);
        //定义每个UICollectionView 的边距距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(0), 0, LENGTH(0));//上左下右
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
        
        //注册cell和ReusableView（相当于头部）
        [_collectionView registerClass:[XunZhangCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
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
        
    }
    return _collectionView;
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
    [_collectionView reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
