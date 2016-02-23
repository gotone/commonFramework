//
//  LCFDefines.h
//  commonFramework
//
//  Created by 李油 on 2/23/16.
//  Copyright © 2016 李油. All rights reserved.
//

#import <Foundation/Foundation.h>

//my logger
#ifdef DEBUG
#define LCFLog(fmt, ...)            NSLog((@"%s [Line:%d] 💚" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define LCFLogWarning(fmt, ...)     NSLog((@"%s [Line:%d] 💛" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#define LCFLogError(fmt, ...)       NSLog((@"%s [Line:%d] ❤️" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define LCFLog(fmt, ...)
#define LCFLogWarning(fmt, ...)
#define LCFLogError(fmt, ...)
#endif

@interface LCFDefines : NSObject

@end
