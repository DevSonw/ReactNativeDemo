//
//  RNRouteManager.h
//  HelloWorld
//
//  Created by Hao on 16/7/14.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RNRouteManager : NSObject
+ (instancetype)sharedInstance;

- (void)retainObject:(id)object;
- (void)releaseObject:(id)object;

@end
