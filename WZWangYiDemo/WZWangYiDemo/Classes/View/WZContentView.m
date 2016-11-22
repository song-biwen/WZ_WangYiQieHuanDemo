//
//  WZContentView.m
//  WZWangYiDemo
//
//  Created by songbiwen on 2016/11/21.
//  Copyright © 2016年 songbiwen. All rights reserved.
//

#import "WZContentView.h"

@interface WZContentView ()
//scrollView
@property (nonatomic, strong) UIScrollView *scrollView;

@end
@implementation WZContentView

- (void)setChannels:(NSArray *)channels {
    _channels = channels;
    CGFloat height = self.frame.size.height;
    CGFloat oraginX = 20;
    for (int i = 0; i < _channels.count; i ++) {
        NSString *title = _channels[i];
        UILabel *label = [[UILabel alloc] init];
        label.text = title;
        label.font = [UIFont systemFontOfSize:18];
        [label sizeToFit];
        
        //设置大小
        CGRect frame = label.frame;
        frame.origin.x = oraginX;
        frame.size.height = self.frame.size.height;
        label.frame = frame;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor brownColor];
        oraginX += label.frame.size.width + 10;
        
        //label添加点击事件
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [label addGestureRecognizer:tapGesture];
        label.userInteractionEnabled = YES;
        
        if (i == 0) {
            label.font = [UIFont systemFontOfSize:18];
            label.textColor = [UIColor redColor];
        }
        
        [self.scrollView addSubview:label];
       
    }
    
    self.scrollView.contentSize = CGSizeMake(oraginX, height);
}


/**
 标题点击事件

 @param tapGesture <#tapGesture description#>
 */
- (void)tapAction:(UITapGestureRecognizer *)tapGesture {
    
    NSInteger index = [self.scrollView.subviews indexOfObject:tapGesture.view];
    if (self.delegate && [self.delegate respondsToSelector:@selector(contentView:didSelectItemAtIndex:)]) {
        [self.delegate contentView:self didSelectItemAtIndex:index];
    }
    
    [self setScale:1.0 forIndex:index];
//    //点击的label，字体颜色变红，字体变大
//    for (int i = 0; i < self.scrollView.subviews.count; i ++) {
//        UILabel *label = self.scrollView.subviews[i];
//        if (i == index) {
//            
//            [UIView animateWithDuration:0.25 animations:^{
//                label.textColor = [UIColor redColor];
//                label.font = [UIFont systemFontOfSize:18];
//            }];
//            
//        }else {
//            label.textColor = [UIColor brownColor];
//            label.font = [UIFont systemFontOfSize:14];
//        }
//    }
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        CGRect frame = self.frame;
        frame.origin.x = 0;
        frame.origin.y = 0;
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        _scrollView.backgroundColor = [UIColor grayColor];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

- (void)setScale:(CGFloat)scale forIndex:(NSInteger)index {
    UILabel *label = self.scrollView.subviews[index];
    label.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1];
    CGFloat fontSize = 14 + (18-14) * scale;
    label.transform = CGAffineTransformMakeScale(fontSize/14, fontSize/14);
}
@end
