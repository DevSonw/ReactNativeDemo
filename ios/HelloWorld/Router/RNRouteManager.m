//
//  RNRouteManager.m
//  HelloWorld
//
//  Created by Hao on 16/7/14.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RNRouteManager.h"

@interface RNRouteManager ()

@property (nonatomic, strong) NSMutableSet *set;

@end

@implementation RNRouteManager

+ (instancetype)sharedInstance {
  static RNRouteManager *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[RNRouteManager alloc] init];
  });
  return instance;
}

- (instancetype)init {
  if (self = [super init]) {
    _set = [[NSMutableSet alloc] init];
  }
  return self;
}

- (void)retainObject:(id)object {
  [self.set addObject:object];
}

- (void)releaseObject:(id)object {
  [self.set removeObject:object];
}
@end
