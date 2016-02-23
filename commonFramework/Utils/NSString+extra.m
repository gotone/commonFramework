//
//  NSString+extra.m
//  commonFramework
//
//  Created by 李油 on 2/23/16.
//  Copyright © 2016 李油. All rights reserved.
//

#import "NSString+extra.h"

@implementation NSString (extra)
- (BOOL)isNilOrEmpty{
    if ((self != nil) && ([self length] > 0)) {
        return NO;
    }
    return YES;
}
@end
