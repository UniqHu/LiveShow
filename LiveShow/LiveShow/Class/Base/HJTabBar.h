//
//  HJTabBar.h
//  LiveShow
//
//  Created by uniqhj on 2017/4/7.
//  Copyright © 2017年 Hujian 😄. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HJTabType) {
    HJTabTypeLaunch = 10,
    HJTabTypeLive = 100,
    HJTabTypeMe,
};


@class HJTabBar;

typedef void(^HJTabBlock)(HJTabBar *tabbar, HJTabType idx);

@protocol HJTabBarDelegate <NSObject>

-(void)tabbar:(HJTabBar *)tabbar clickedBtn:(NSUInteger)idx;

@end

@interface HJTabBar : UIView
/** delegate */
@property (nonatomic, weak  )  id<HJTabBarDelegate> delegate;
/** block */
@property (nonatomic, copy  )  HJTabBlock block;
@end
