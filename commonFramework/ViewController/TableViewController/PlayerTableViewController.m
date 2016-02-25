//
//  PlayerTableViewController.m
//  commonFramework
//
//  Created by 李油 on 2/25/16.
//  Copyright © 2016 李油. All rights reserved.
//

#import "PlayerTableViewController.h"
#import "Player.h"
#import "MBProgressHUD.h"

#import <UIKit/UIColor.h>

#define tableViewNameTag        1001
#define tableViewGameTag        1002
#define tableViewPicTag         1003

#define tableViewHeaderHeight   20
#define tableViewFooterHeight   20

@interface PlayerTableViewController()
@property(strong, nonatomic)NSTimer *progressTimer;
@end

@implementation PlayerTableViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _progressTimer = [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(hideProgressHUD) userInfo:nil repeats:NO];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self hideProgressHUD];
    [_progressTimer invalidate];
    _progressTimer = nil;
}

- (void)hideProgressHUD{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_mutableArrayPlayers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndetifier = @"tableViewCellPlayers1001";
    //storyboard已经初始化好，自己不用再初始化
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    
    Player *player = _mutableArrayPlayers[indexPath.row];
    UILabel *name = (UILabel *)[cell viewWithTag:tableViewNameTag];
    UILabel *game = (UILabel *)[cell viewWithTag:tableViewGameTag];
    UIImageView *titleImage = (UIImageView *)[cell viewWithTag:tableViewPicTag];
    
    name.text = player.name;
    game.text = player.game;

    titleImage.image = [self loadImageData:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    int expectedHeight = [self getExpectedCellHeight:tableView];
    if (expectedHeight > 0) {
        return expectedHeight;
    }
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return tableViewHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return tableViewFooterHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"TEST header";
}

- (int)getExpectedCellHeight:(UITableView *)tableView{
    static NSString *cellIndetifier = @"tableViewCellPlayers1001";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (cell != nil) {
        UILabel *name = (UILabel *)[cell viewWithTag:tableViewNameTag];
        UILabel *game = (UILabel *)[cell viewWithTag:tableViewGameTag];
        CGRect nameRect = [name frame];
        CGRect gameRect = [game frame];
        
        float cellHeight = (nameRect.size.height + gameRect.size.height)*1.5;
        return cellHeight;
    }
    return 0;
}

- (UIImage *)loadImageData:(NSUInteger)index{
    //start from 0
    index ++;
    if (index>3) {
        index = 3;
    }
    NSString *imageFile = [NSString stringWithFormat:@"images%d.jpeg", (int)index];
    UIImage *image = [UIImage imageNamed:imageFile];
    return image;
}

@end
