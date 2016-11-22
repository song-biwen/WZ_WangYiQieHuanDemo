//
//  WZMainViewController.m
//  WZWangYiDemo
//
//  Created by songbiwen on 2016/11/21.
//  Copyright © 2016年 songbiwen. All rights reserved.
//

#import "WZMainViewController.h"
#import "WZContentView.h"

static NSString *const cellIndentifier = @"Cell";
static NSInteger const labelTag = 100;

@interface WZMainViewController ()
<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//数据
@property (nonatomic, strong) NSArray *array;
//collectionView
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) WZContentView *contentView;
@end

@implementation WZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupContentView];
    
    [self.collectionView reloadData];
}


//添加内容
- (void)setupContentView {
    WZContentView *contentView = [[WZContentView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 35)];
    contentView.channels = self.array;
    [self.view addSubview:contentView];
    self.contentView = contentView;
}

- (NSArray *)array {
    if (!_array) {
        _array = [[NSArray alloc] initWithObjects:@"房产",@"直播",@"轻松一刻",@"独家",@"社会",@"手机",@"数码",@"酒香",@"美女",@"艺术",@"读书",@"情感",@"论坛",@"博客",@"NBA",@"旅游",@"跑步",@"影视",@"政务",@"本地",@"汽车",@"公开课",@"游戏",@"独家",@"时尚",@"轻松一刻",@"社会",@"漫画", nil];
    }
    return _array;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        CGRect orangeFrame = self.view.frame;
        CGFloat contentViewBottom = self.contentView.frame.origin.y + self.contentView.frame.size.height;
        CGRect frame = CGRectMake(0, contentViewBottom,orangeFrame.size.width, orangeFrame.size.height - contentViewBottom);
        
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = frame.size;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor greenColor];
        _collectionView.pagingEnabled = YES;
        
        //注册cell
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIndentifier];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}
#pragma mark - UICollectionViewDelegate
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor brownColor];
    UILabel *label = [cell.contentView viewWithTag:labelTag];
    if (label == nil) {
        label = [[UILabel alloc] init];
        label.tag = labelTag;
        label.font = [UIFont systemFontOfSize:18];
        label.textColor = [UIColor redColor];
        [cell.contentView addSubview:label];
        label.center = CGPointMake(CGRectGetMidX(cell.contentView.frame),CGRectGetMidY(cell.contentView.frame));
    }
    label.text = self.array[indexPath.row];
    [label sizeToFit];
    return cell;
}

@end
