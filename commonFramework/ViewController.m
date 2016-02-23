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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

@end
