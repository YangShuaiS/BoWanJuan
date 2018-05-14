//
//  FoundHotXunZhang.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/2.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundHotXunZhang.h"
#import "FoundHotXunZCollectionViewCell.h"
#define itemWidth (WIDTH - 60)/2
#define itemHeight itemWidth*0.5+170/2

@interface FoundHotXunZhang ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView; /**< 集合视图 */
@end


@implementation FoundHotXunZhang{
    BaseLabel * Title;
    BaseLabel * more;
    BaseButton * morebutton;
}
- (void)setItemarray:(NSMutableArray *)itemarray{
    _itemarray = itemarray;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    Title = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:@"好友在读"];
    [self addSubview:Title];

    more = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(LinShiFont) TextAlignment:NSTextAlignmentLeft Text:ZHANWEIZI];
    [self addSubview:more];

    morebutton = [BaseButton buttonWithType:UIButtonTypeCustom];
    [morebutton addTarget:self action:@selector(morebutton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:morebutton];

    [self addSubview:self.collectionView];

}
- (void)morebutton{
    [_collectionView reloadData];

}
- (void)layoutSubviews{
    WS(ws);

    [Title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(12);
        make.left.equalTo(ws).with.offset(12);
    }];
    
    [more mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(12);
        make.right.equalTo(ws).with.offset(-12);
    }];


    [morebutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(0);
        make.right.equalTo(ws).with.offset(0);
        make.left.mas_equalTo(self->more.mas_left);
    }];

    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.mas_equalTo(ws);
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(self->Title.mas_bottom).with.offset(20);
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(0);
    }];
    CGFloat collheight = _collectionView.contentSize.height;

    [_collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(collheight);
    }];
    
}

#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // item重用机制
    
    FoundHotXunZCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell color];
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
    
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//
//    CGSize size = CGSizeMake(itemWidth,itemHeight);
//    return size;
//}
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
        //定义每个UICollectionView 横向的间距
        flowLayout.minimumLineSpacing = 10;
        //定义每个UICollectionView 纵向的间距
        flowLayout.minimumInteritemSpacing = 20;
        //定义每个UICollectionView 的边距距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);//上左下右
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
        
        //注册cell和ReusableView（相当于头部）
        [_collectionView registerClass:[FoundHotXunZCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
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
        
    }else{
        
        [_collectionView reloadData];
    }
    return _collectionView;
}
@end
