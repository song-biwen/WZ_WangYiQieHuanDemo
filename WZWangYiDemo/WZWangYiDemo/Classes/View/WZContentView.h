//
//  WZContentView.h
//  WZWangYiDemo
//
//  Created by songbiwen on 2016/11/21.
//  Copyright © 2016年 songbiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WZContentView;
@protocol WZContentViewDelegate <NSObject>
- (void)contentView:(WZContentView *)contentView didSelectItemAtIndex:(NSInteger)index;
@end
@interface WZContentView : UIView
@property (nonatomic, strong) NSArray *channels;
@property (nonatomic, assign) id<WZContentViewDelegate> delegate;
- (void)setScale:(CGFloat)scale forIndex:(NSInteger)index;
@end
