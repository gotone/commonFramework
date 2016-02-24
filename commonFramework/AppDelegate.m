//
//  AppDelegate.m
//  commonFramework
//
//  Created by 李油 on 2/23/16.
//  Copyright © 2016 李油. All rights reserved.
//

#import "AppDelegate.h"
#import "LCFDefines.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    if (_appDelegateDelegate && [_appDelegateDelegate respondsToSelector:@selector(appWillResignActive:)]) {
        [_appDelegateDelegate appWillResignActive:application];
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    //开始long-run进程
    _backgroundTaskIdentifier = [application beginBackgroundTaskWithExpirationHandler:^(){
        [self backgroundTaskTimeExpired];
    }];
    
    _appDelegateTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(backgroundTask) userInfo:nil repeats:YES];
    
    if (_appDelegateDelegate && [_appDelegateDelegate respondsToSelector:@selector(appDidEnterBackground:)]) {
        [_appDelegateDelegate appDidEnterBackground:application];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    //进入前台时杀掉long-run进程
    if (_backgroundTaskIdentifier != UIBackgroundTaskInvalid) {
        [self backgroundTaskTimeExpired];
    }
    if (_appDelegateDelegate && [_appDelegateDelegate respondsToSelector:@selector(appWillEnterForground:)]) {
        [_appDelegateDelegate appWillEnterForground:application];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    if (_appDelegateDelegate && [_appDelegateDelegate respondsToSelector:@selector(appDidBecomeActive:)]) {
        [_appDelegateDelegate appDidBecomeActive:application];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - backgroun task
- (void)backgroundTask{
    NSTimeInterval backgroundTimeRemaining = [[UIApplication sharedApplication] backgroundTimeRemaining];
    LCFLog("%f", backgroundTimeRemaining);
    if (backgroundTimeRemaining < (float)100) {
        [self backgroundTaskTimeExpired];
    }
}

- (void)backgroundTaskTimeExpired{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    __weak AppDelegate *weakSelf = self;
    dispatch_async(mainQueue, ^(){
        AppDelegate *strongSelf = weakSelf;
        if (strongSelf != nil) {
            [strongSelf.appDelegateTimer invalidate];
        }
        [[UIApplication sharedApplication] endBackgroundTask:self.backgroundTaskIdentifier];
        self.backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    });
}

@end
