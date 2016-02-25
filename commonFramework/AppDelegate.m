//
//  AppDelegate.m
//  commonFramework
//
//  Created by 李油 on 2/23/16.
//  Copyright © 2016 李油. All rights reserved.
//

#import "AppDelegate.h"
#import "LCFDefines.h"
#import "Player.h"
#import "PlayerTableViewController.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSMutableArray *players;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //添加数据到tableViewController
    _players = [[NSMutableArray alloc] initWithCapacity:10];
    
    Player *player1 = [[Player alloc] init];
    player1.name = @"bill";
    player1.game = @"112233";
    player1.rating = 99;
    [_players addObject:player1];
    
    Player *player2 = [[Player alloc] init];
    player2.name = @"bill2";
    player2.game = @"223344";
    player2.rating = 88;
    [_players addObject:player2];
    
    Player *player3 = [[Player alloc] init];
    player3.name = @"bill3";
    player3.game = @"223344";
    player3.rating = 88;
    [_players addObject:player3];
    
    Player *player4 = [[Player alloc] init];
    player4.name = @"bill4";
    player4.game = @"223344";
    player4.rating = 88;
    [_players addObject:player4];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *navController = (tabBarController.viewControllers)[0];//UITableViewController
    PlayerTableViewController *playerController = (navController.viewControllers)[0];
    playerController.mutableArrayPlayers = _players;
    
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


#pragma mark - background task
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
