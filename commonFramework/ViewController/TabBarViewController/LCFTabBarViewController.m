//
//  LCFTabBarViewController.m
//  commonFramework
//
//  Created by 李油 on 2/27/16.
//  Copyright © 2016 李油. All rights reserved.
//

#import "LCFTabBarViewController.h"
#import "LCFDefines.h"
#import "LCFNavigationController.h"
#import "PlayerTableViewController.h"
#import "MBProgressHUD.h"

@interface LCFTabBarViewController ()
@property (strong, nonatomic) NSTimer *countingTimer;
@end

@implementation LCFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray<id> *viewControllers = self.viewControllers;
//    PlayerTableViewController *tableViewController = nil;
    
    for (UIViewController *unknownViewController in viewControllers) {
        if ([unknownViewController isMemberOfClass:[LCFNavigationController class]]) {
            LCFNavigationController *navController = (LCFNavigationController *)unknownViewController;
            NSArray<id> *inNavControllers = navController.viewControllers;
            for (UIViewController *viewController in inNavControllers) {
                if ([viewController isMemberOfClass:[PlayerTableViewController class]]) {
                    PlayerTableViewController *tableViewController =  (PlayerTableViewController *)viewController;
                    LCFLog(@"class:%@", [tableViewController description]);
                }
            }
        }
    }
    LCFLog(@"view did load");
//    [self showProgress];
//    _countingTimer = [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(hideProgress) userInfo:nil repeats:NO];
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

- (void)viewWillDisappear:(BOOL)animated{
//    [self hideProgress];
    [_countingTimer invalidate];
}

- (void)showProgress{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        });
    });
}

- (void)hideProgress{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

@end
