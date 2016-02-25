//
//  PlayerTableViewController.m
//  commonFramework
//
//  Created by 李油 on 2/25/16.
//  Copyright © 2016 李油. All rights reserved.
//

#import "PlayerTableViewController.h"
#import "Player.h"

#define tableViewNameTag        1001
#define tableViewGameTag        1002
#define tableViewPicTag         1003

@interface PlayerTableViewController()

@end

@implementation PlayerTableViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_mutableArrayPlayers count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    int expectedHeight = [self getExpectedCellHeight:tableView];
    if (expectedHeight > 0) {
        return expectedHeight;
    }
    return 60;
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
