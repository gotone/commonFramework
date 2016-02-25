//
//  PlayerTableViewController.m
//  commonFramework
//
//  Created by 李油 on 2/25/16.
//  Copyright © 2016 李油. All rights reserved.
//

#import "PlayerTableViewController.h"
#import "Player.h"

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
    static NSString *cellIndetifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndetifier];
    }
    
    Player *player = _mutableArrayPlayers[indexPath.row];
    cell.textLabel.text = player.name;
    cell.detailTextLabel.text = player.game;
    
    return cell;
}

@end
