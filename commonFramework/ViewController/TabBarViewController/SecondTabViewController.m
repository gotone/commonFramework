//
//  SecondTabViewController.m
//  commonFramework
//
//  Created by 李油 on 2/25/16.
//  Copyright © 2016 李油. All rights reserved.
//

#import "SecondTabViewController.h"
#import "LCFDefines.h"

@interface SecondTabViewController ()

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
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    LCFLog(@"view will disappear:%@", NSStringFromClass(self.class));
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    LCFLog(@"view did disappear:%@", NSStringFromClass(self.class));
}

@end
