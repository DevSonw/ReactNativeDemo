//
//  RNUserRouter.m
//  HelloWorld
//
//  Created by Hao on 16/7/14.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RNViewRouter.h"
#import "ViewManager.h"

@implementation RNViewRouter

- (void)callFunction:(NSString *)functionName token:(NSString *)token parameters:(NSDictionary *)parameters callback:(RCTResponseSenderBlock)callback {
  
  if ([functionName.lowercaseString isEqualToString:@"login"]) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [[ViewManager shared]showLoginViewController:^(NSString *key, NSDictionary *userInfo) {
        if ([key.lowercaseString isEqualToString:@"login.success"]) {
          if (callback) {
            callback(@[key,userInfo]);
          }
        }
      }];
    });
  }
}
@end
