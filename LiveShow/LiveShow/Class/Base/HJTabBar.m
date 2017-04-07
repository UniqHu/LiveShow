//
//  HJTabBar.m
//  LiveShow
//
//  Created by uniqhj on 2017/4/7.
//  Copyright © 2017年 Hujian 😄. All rights reserved.
//

#import "HJTabBar.h"

@interface HJTabBar()


@property (nonatomic, strong)  UIImageView *tabbgView;

@property (nonatomic, strong)  NSArray *dataList;

@property (nonatomic, strong)  UIButton *preButton;

@property (nonatomic, strong)  UIButton *cameraButton;

@end

@implementation HJTabBar

-(UIButton *)cameraButton{
    if (!_cameraButton) {
        _cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraButton setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraButton addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        _cameraButton.tag = HJTabTypeLaunch;
    }
    return _cameraButton;
}

-(NSArray*)dataList{
    if (!_dataList) {
        _dataList = @[@"tab_live",@"tab_me"];
    }
    return _dataList;
}

-(UIImageView*)tabbgView{
    if (!_tabbgView) {
        _tabbgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbgView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tabbgView];
        for (NSInteger i = 0; i < self.dataList.count; i ++) {
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            NSString *imgName = _dataList[i];
            item.adjustsImageWhenHighlighted = NO;
            [item setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[imgName stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            item.tag = HJTabTypeLive + i;
            if (i == 0) {
                item.selected = YES;
                self.preButton = item;
            }
            [self addSubview:item];
        }
        [self addSubview:self.cameraButton];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _tabbgView.frame = self.bounds;
    CGFloat width = self.bounds.size.width / (_dataList.count * 1.0);
    for (NSInteger i = 0; i < self.subviews.count; i ++) {
        UIView *view = self.subviews[i];
        if ([view isKindOfClass:[UIButton class]]) {
            view.frame = CGRectMake((view.tag - HJTabTypeLive)*width, 0, width, self.bounds.size.height);
        }
    }
    [self.cameraButton sizeToFit];
    self.cameraButton.center = CGPointMake(self.center.x, 0);
    
}

-(void)clickItem:(UIButton *)item{
    if ([self.delegate respondsToSelector:@selector(tabbar:clickedBtn:)]) {
        [self.delegate tabbar:self clickedBtn:item.tag ];
    }
    //    if (self.block) {
    //        self.block(self,item.tag);
    //    }
    !self.block?:self.block(self,item.tag);
    
    if (item.tag == HJTabTypeLaunch) {
        return;
    }
    
    self.preButton.selected = NO;
    item.selected = YES;
    self.preButton = item;
    
    [UIView animateWithDuration:0.2 animations:^{
        item.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
          item.transform = CGAffineTransformIdentity;
        }];
    }];

}







@end
