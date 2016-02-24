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
    if (_appDelegateDelegate && [_appDelegateDelegate respondsToSelector:@selector(appDidEnterBackground:)]) {
        [_appDelegateDelegate appDidEnterBackground:application];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
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

@end
