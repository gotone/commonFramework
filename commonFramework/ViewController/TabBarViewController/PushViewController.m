//
//  PushViewController.m
//  commonFramework
//
//  Created by 李油 on 2/29/16.
//  Copyright © 2016 李油. All rights reserved.
//

#import "PushViewController.h"
#import "LCFDefines.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onDismissSelf:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        LCFLog(@"dismiss self with animatiion");
    }];
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
