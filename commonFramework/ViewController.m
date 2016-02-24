//
//  ViewController.m
//  commonFramework
//
//  Created by 李油 on 2/23/16.
//  Copyright © 2016 李油. All rights reserved.
//

#import "ViewController.h"
#import "LCFDefines.h"
#import "NSString+extra.h"

@interface ViewController ()
@property (weak, nonatomic) AppDelegate *delegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取UIApplicationDelegate的代理
    _delegate = [[UIApplication sharedApplication] delegate];
    _delegate.appDelegateDelegate = self;
}

- (void)viewWillAppear:(BOOL)animated{
    LCFLog(@"view will appear");
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    LCFLog(@"view will disappear");
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AppDelegate Delegate
- (void)appWillResignActive:(UIApplication *)application{
    LCFLog(@"appWillResignActive");
}
- (void)appDidBecomeActive:(UIApplication *)application{
    LCFLog(@"appDidBecomeActive");
}
- (void)appWillEnterForground:(UIApplication *)application{
    LCFLog(@"appWillEnterForground");
}
- (void)appDidEnterBackground:(UIApplication *)application{
    LCFLog(@"appDidEnterBackground");
}

@end
