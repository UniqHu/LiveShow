//
//  HJTabBarController.m
//  LiveShow
//
//  Created by uniqhj on 2017/4/7.
//  Copyright © 2017年 Hujian 😄. All rights reserved.
//

#import "HJTabBarController.h"
#import "HJTabBar.h"
#import "MainViewController.h"
#import "MeViewController.h"
#import "HJBaseNavController.h"
#import "LaunchViewController.h"


@interface HJTabBarController ()<HJTabBarDelegate>

@property (nonatomic, strong)  HJTabBar *hjTabbar;

@end

@implementation HJTabBarController

-(HJTabBar *)hjTabbar{
    if (!_hjTabbar) {
        _hjTabbar = [[HJTabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _hjTabbar.delegate = self;
    }
    return _hjTabbar;
}

-(void)tabbar:(HJTabBar *)tabbar clickedBtn:(NSUInteger)idx{
    if (idx != HJTabTypeLaunch) {
        self.selectedIndex = idx - HJTabTypeLive;
        return;
    }
    LaunchViewController *lvc = [[LaunchViewController alloc] init];
    [self presentViewController:lvc animated:YES completion:^{
        
    }];
}


-(void)loadViewControllers{
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@"MainViewController",@"MeViewController"]];
    for (NSInteger i = 0; i < arr.count; i ++) {
        UIViewController *vc = [[NSClassFromString(arr[i]) alloc] init];
        HJBaseNavController *nav = [[HJBaseNavController alloc] initWithRootViewController:vc];
        [arr replaceObjectAtIndex:i  withObject:nav];
    }
    self.viewControllers = arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadViewControllers];
    [self.tabBar addSubview:self.hjTabbar];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
