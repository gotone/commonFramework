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
#import "LCFDefines.h"

#import <UIKit/UIColor.h>

#define tableViewNameTag        1001
#define tableViewGameTag        1002
#define tableViewPicTag         1003

#define tableViewHeaderHeight   20
#define tableViewFooterHeight   20

#define NUMBER_OF_SECTIONS      1

#define tableViewSection0       0
#define tableViewSection1       1
#define tableViewSection2       2
#define tableViewSection3       3

#define tableViewRow0           0
#define tableViewRow1           1
#define tableViewRow2           2
#define tableViewRow3           3

#define scheduleTimeInterval5    (2.0f)

#define DISPATCH_QUEUE_FLAG_0   0

@interface PlayerTableViewController()
@property(strong, nonatomic)NSTimer *progressTimer;
@end

@implementation PlayerTableViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self showProgressHUD];
    _progressTimer = [NSTimer scheduledTimerWithTimeInterval:scheduleTimeInterval5 target:self selector:@selector(hideProgressHUD) userInfo:nil repeats:NO];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self hideProgressHUD];
    [_progressTimer invalidate];
    _progressTimer = nil;
}

- (void)showProgressHUD{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, DISPATCH_QUEUE_FLAG_0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak typeof(self) weakSelf = self;
            [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
        });
    });
}

- (void)hideProgressHUD{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, DISPATCH_QUEUE_FLAG_0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak typeof(self) weakSelf = self;
            [MBProgressHUD hideHUDForView:weakSelf.view animated:YES];
        });
    });
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return NUMBER_OF_SECTIONS;
}

//某个section的某个row是否允许编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    //cell个数大于1是允许删除，当只有一个cell时则不再允许删除
    if([[tableView visibleCells] count] > 1){
        return YES;
    }
    return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == tableViewSection0) {
//        return UITableViewCellEditingStyleNone;
//    }
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self reloadData];
    [_mutableArrayPlayers removeObjectAtIndex:indexPath.row];
    if (tableView.numberOfSections <= 1) {
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }else{
        //多个section共享一份数据会造成数据错误，实际中应该也没有这种情况出现，这种写法是错误的
        [self.tableView reloadData];
    }
}

//选中tableview的某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LCFLog(@"indexPath section:%ld, row:%ld", indexPath.section, indexPath.row);
}
//展示某一个cell
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    UILabel *name = (UILabel *)[cell viewWithTag:tableViewNameTag];
    UILabel *game = (UILabel *)[cell viewWithTag:tableViewGameTag];
    
//    LCFLog(@"cell info %@, %@ with cell section %ld and row:%ld", name.text, game.text, indexPath.section, indexPath.row);
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    LCFLog(@"accessory button tapped section:%ld, row:%ld", indexPath.section, indexPath.row);
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
    
    switch (indexPath.section) {
        case tableViewSection0:{
            if (indexPath.row == 2) {
                cell.accessoryType = UITableViewCellAccessoryDetailButton;
            }else{
                cell.accessoryType = UITableViewCellAccessoryNone;
            }
            name.text = player.name;
            game.text = player.game;
        }
            break;
        case tableViewSection1:{
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            name.text = [[NSString alloc] initWithFormat:@"%@+%@", player.name, @"2"];
            game.text = [[NSString alloc] initWithFormat:@"%@+%@", player.game, @"2"];
        }
            break;
        case tableViewSection2:{
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            name.text = [[NSString alloc] initWithFormat:@"%@+%@", player.name, @"3"];
            game.text = [[NSString alloc] initWithFormat:@"%@+%@", player.game, @"3"];
        }
            break;
        default:
            break;
    }
    
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
    switch (section) {
        case tableViewSection0:{
            return @"section #1";
        }
            break;
        case tableViewSection1:{
            return @"section #2";
        }
            break;
        case tableViewSection2:{
            return @"section #3";
        }
            break;
        case tableViewSection3:{
            return @"section #4";
        }
            break;
        default:
            break;
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    switch (section) {
        case tableViewSection0:{
            return @"section #1 end";
        }
            break;
        case tableViewSection1:{
            return @"section #2 end";
        }
            break;
        case tableViewSection2:{
            return @"section #3 end";
        }
            break;
        case tableViewSection3:{
            return @"section #4 end";
        }
            break;
        default:
            break;
    }
    return nil;
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

- (void)reloadData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, DISPATCH_QUEUE_FLAG_0), ^{
        __weak typeof(self) weakSelf = self;
        //data operation
        [weakSelf.mutableArrayPlayers removeLastObject];
        [weakSelf.tableView reloadData];
    });
}

@end
