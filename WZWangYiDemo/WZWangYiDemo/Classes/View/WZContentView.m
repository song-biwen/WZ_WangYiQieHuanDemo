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
        oraginX += label.frame.size.width + 10;
        
        [self.scrollView addSubview:label];
       
    }
    
    self.scrollView.contentSize = CGSizeMake(oraginX, height);
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


@end
