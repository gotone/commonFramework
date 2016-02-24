//
//  AppDelegate.h
//  commonFramework
//
//  Created by 李油 on 2/23/16.
//  Copyright © 2016 李油. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AppDelegateProtocol <NSObject>

@optional
- (void)appWillResignActive:(UIApplication *)application;
- (void)appDidBecomeActive:(UIApplication *)application;
- (void)appDidEnterBackground:(UIApplication *)application;
- (void)appWillEnterForground:(UIApplication *)application;
@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (weak, nonatomic) id<AppDelegateProtocol> appDelegateDelegate;

@property (unsafe_unretained, nonatomic) UIBackgroundTaskIdentifier backgroundTaskIdentifier;

@property (strong, nonatomic) NSTimer *appDelegateTimer;

@end

