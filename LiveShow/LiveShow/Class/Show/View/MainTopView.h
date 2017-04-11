//
//  MainTopView.h
//  LiveShow
//
//  Created by uniqhj on 2017/4/11.
//  Copyright © 2017年 Hujian 😄. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger tag);

@interface MainTopView : UIView
- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;

@property (nonatomic, copy) MainTopBlock block;

- (void)scrolling:(NSInteger)tag;
@end
