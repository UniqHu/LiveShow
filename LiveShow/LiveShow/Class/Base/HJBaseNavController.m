//
//  HJBaseNavController.m
//  LiveShow
//
//  Created by uniqhj on 2017/4/7.
//  Copyright © 2017年 Hujian 😄. All rights reserved.
//

#import "HJBaseNavController.h"

@interface HJBaseNavController ()

@end

@implementation HJBaseNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = RGB(0, 216, 201);
    self.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
