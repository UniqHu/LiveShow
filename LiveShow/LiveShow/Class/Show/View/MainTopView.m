//
//  MainTopView.m
//  LiveShow
//
//  Created by uniqhj on 2017/4/11.
//  Copyright © 2017年 Hujian 😄. All rights reserved.
//

#import "MainTopView.h"

@interface MainTopView()

@property (nonatomic, strong) UIView * lineView;

@property (nonatomic, strong) NSMutableArray * buttons;

@end

@implementation MainTopView

- (NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat btnW = self.width / titles.count;
        CGFloat btnH = self.height;
        for (NSInteger i = 0; i < titles.count; i ++) {
            UIButton * titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.buttons addObject:titleBtn];
            NSString * vcName = titles[i];
            [titleBtn setTitle:vcName forState:UIControlStateNormal];
            //设置按钮颜色
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            //设置字体
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:18];
            titleBtn.tag = i;
            titleBtn.frame = CGRectMake(i * btnW, 0, btnW, btnH);
            [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:titleBtn];
            
            if (i == 1) {
                CGFloat h = 2;
                CGFloat y = 40;
                [titleBtn.titleLabel sizeToFit];
                self.lineView = [[UIView alloc] init];
                self.lineView.backgroundColor = [UIColor whiteColor];
                self.lineView.height = h;
                self.lineView.width = titleBtn.titleLabel.width;
                self.lineView.top = y;
                self.lineView.centerX = titleBtn.centerX;
                [self addSubview:self.lineView];
            }
        }
    }
    return self;
}

- (void)titleClick:(UIButton *)button {
    self.block(button.tag);
    [self scrolling:button.tag];
}


- (void)scrolling:(NSInteger)tag {
    UIButton * button = self.buttons[tag];
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.centerX = button.centerX;
    }];
}




@end
