//
//  FoundFriendTableViewCell.m
//  BoVolumesForipad
//
//  Created by 杨帅 on 2018/5/16.
//  Copyright © 2018年 YS. All rights reserved.
//

#import "FoundFriendTableViewCell.h"
#import "FriendXunZHangView.h"
#import "ShiDuCollectionViewCell.h"
#define itemWidth LENGTH(96)
#define itemHeight itemWidth*1.625
@interface FoundFriendTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView; /**< 集合视图 */

@end

@implementation FoundFriendTableViewCell{
    FLAnimatedImageView * UserImageView;
    BaseLabel * Name;
    BaseLabel * lV;
    BaseLabel * Jf;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addview];
    }
    return self;
}
- (void)addview{
    UserImageView = [FLAnimatedImageView new];
    UserImageView.backgroundColor = RANDOMCOLOR;
    UserImageView.layer.masksToBounds = YES;
    UserImageView.layer.cornerRadius = LENGTH(29);
    [self addSubview:UserImageView];
    
    Name = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font18) TextAlignment:NSTextAlignmentLeft Text:@"名字"];
    [self addSubview:Name];
    
    lV = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:@"Lv2"];
    [self  addSubview:lV];
    
    Jf = [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:@"9999积分"];
    [self addSubview:Jf];
    
    BaseLabel * ZJZD =  [[BaseLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) LabelTxteColor:LinShiZiTiYanSe LabelFont:TextFont(Font15) TextAlignment:NSTextAlignmentLeft Text:@"最近在读的书"];
    [self addSubview:ZJZD];
    
    FriendXunZHangView * view = [FriendXunZHangView new];
    view.itemWidths = LENGTH(50);
    //    view.backgroundColor = RANDOMCOLOR;
    NSMutableArray * a = [NSMutableArray array];
    for (int i=0; i<60;i++) {
        [a addObject:@"123"];
    }
    view.itemarray = a;
    [self addSubview:view];
    
    WS(ws);
    [UserImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws).with.offset(LENGTH(30));
        make.left.equalTo(ws).with.offset(LENGTH(25));
        make.width.mas_equalTo(LENGTH(58));
        make.height.mas_equalTo(LENGTH(58));
    }];
    
    [Name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->UserImageView.mas_top).with.offset(LENGTH(10));
        make.left.equalTo(self->UserImageView.mas_right).with.offset(LENGTH(2));
    }];
    
    [lV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->Name.mas_centerY);
        make.left.equalTo(self->Name.mas_right).with.offset(LENGTH(1));
    }];
    
    [Jf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->UserImageView.mas_right).with.offset(LENGTH(2));
        make.bottom.equalTo(self->UserImageView.mas_bottom).with.offset(-LENGTH(5));
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->UserImageView.mas_centerY);
        make.left.equalTo(self->lV.mas_right).with.offset(LENGTH(40));
        make.right.equalTo(ws).with.offset(-LENGTH(26));
    }];
    
    [ZJZD mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->UserImageView.mas_bottom).with.offset(LENGTH(26));
        make.left.equalTo(ws).with.offset(LENGTH(25));
    }];
    
    
    [self addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.mas_equalTo(ws);
        make.left.equalTo(ws).with.offset(0);
        make.top.equalTo(ZJZD.mas_bottom).with.offset(LENGTH(15));
        make.right.equalTo(ws).with.offset(0);
        make.bottom.equalTo(ws).with.offset(-LENGTH(30));
        make.height.mas_offset(itemHeight);
    }];
}
#pragma mark *** UICollectionViewDataSource ***
// 设置组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// 设置行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return _itemarray.count;
    return 6;

}

// 设置单元格
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // item重用机制
    
    ShiDuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = RANDOMCOLOR;
    return cell;
}

-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath{
//    [self.delegate PushFriendViewCOntroller];
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(itemWidth,itemHeight);
        //定义每个UICollectionView 横向的间距
        flowLayout.minimumLineSpacing = LENGTH(25);
        //定义每个UICollectionView 纵向的间距
        flowLayout.minimumInteritemSpacing = LENGTH(25);
        //定义每个UICollectionView 的边距距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, LENGTH(29), 0, LENGTH(29));//上左下右
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0,0) collectionViewLayout:flowLayout];
        
        //注册cell和ReusableView（相当于头部）
        [_collectionView registerClass:[ShiDuCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
