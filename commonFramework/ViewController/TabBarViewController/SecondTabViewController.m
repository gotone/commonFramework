//
//  SecondTabViewController.m
//  commonFramework
//
//  Created by 李油 on 2/25/16.
//  Copyright © 2016 李油. All rights reserved.
//

#import "SecondTabViewController.h"
#import "LCFDefines.h"
#import "MBProgressHUD.h"

@interface SecondTabViewController ()
@property (strong, nonatomic) NSTimer *progressTimer;
@end

@implementation SecondTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LCFLog(@"view did load:%@", NSStringFromClass(self.class));
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

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    LCFLog(@"view will appear:%@", NSStringFromClass(self.class));
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    LCFLog(@"view did appear:%@", NSStringFromClass(self.class));
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _progressTimer = [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(hideProgressHUD) userInfo:nil repeats:NO];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    LCFLog(@"view will disappear:%@", NSStringFromClass(self.class));
    [self hideProgressHUD];
    [_progressTimer invalidate];
    _progressTimer = nil;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    LCFLog(@"view did disappear:%@", NSStringFromClass(self.class));
}

- (void)hideProgressHUD{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

@end
