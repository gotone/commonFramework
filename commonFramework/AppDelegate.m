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

@synthesize appDelegateDelegate;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    if (appDelegateDelegate && [appDelegateDelegate respondsToSelector:@selector(appWillResignActive:)]) {
        [appDelegateDelegate appWillResignActive:application];
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    if (appDelegateDelegate && [appDelegateDelegate respondsToSelector:@selector(appDidEnterBackground:)]) {
        [appDelegateDelegate appDidEnterBackground:application];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    if (appDelegateDelegate && [appDelegateDelegate respondsToSelector:@selector(appWillEnterForground:)]) {
        [appDelegateDelegate appWillEnterForground:application];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    if (appDelegateDelegate && [appDelegateDelegate respondsToSelector:@selector(appDidBecomeActive:)]) {
        [appDelegateDelegate appDidBecomeActive:application];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
