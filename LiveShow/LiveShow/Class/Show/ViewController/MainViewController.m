//
//  MainViewController.m
//  LiveShow
//
//  Created by uniqhj on 2017/4/7.
//  Copyright © 2017年 Hujian 😄. All rights reserved.
//

#import "MainViewController.h"
#import "MainTopView.h"

@interface MainViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@property (nonatomic, strong) NSArray * datalist;

@property (nonatomic, strong) MainTopView * topView;

@end

@implementation MainViewController

- (NSArray *)datalist {
    if (!_datalist) {
        _datalist = @[@"关注",@"热门",@"附近"];
    }
    return _datalist;
}

-(MainTopView *)topView{
    if (!_topView) {
        _topView = [[MainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 50) titleNames:self.datalist];
        @weakify(self);
        _topView.block = ^(NSInteger tag) {
            @strongify(self);
            CGPoint point = CGPointMake(tag * SCREEN_WIDTH, self.contentScrollView.contentOffset.y);
            [self.contentScrollView setContentOffset:point animated:YES];
        };
    }
    return _topView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI]; 
}

-(void)initUI{
    [self setUpNav];
    [self setUpChildViewControllers];
}

- (void)setUpNav {
    self.navigationItem.titleView = self.topView;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
}

-(void)setUpChildViewControllers{
    NSArray * vcNames = @[@"ConcernViewController",@"HotViewController",@"NearViewController"];
    for (NSInteger i = 0; i < vcNames.count; i ++) {
        NSString *vcName = vcNames[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        vc.title = self.datalist[i];
        [self addChildViewController:vc];
    }
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.datalist.count, 0);
    self.contentScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    CGFloat width = SCREEN_WIDTH;//scrollView.frame.size.width;
    CGFloat height = SCREEN_HEIGHT - 64 - 49;
    CGFloat offset = scrollView.contentOffset.x;
    NSInteger idx = offset / width;
    //索引值联动topView
    [self.topView scrolling:idx];
    
    UIViewController * vc = self.childViewControllers[idx];
    //判断当前vc是否执行过viewdidLoad
    if ([vc isViewLoaded]) return;
    //设置子控制器view的大小
    vc.view.frame = CGRectMake(offset, 0, scrollView.frame.size.width, height);
    //将子控制器的view加入scrollview上
    [scrollView addSubview:vc.view];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
