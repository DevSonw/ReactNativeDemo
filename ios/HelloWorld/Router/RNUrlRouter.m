//
//  RNUrlRouter.m
//  HelloWorld
//
//  Created by Hao on 16/7/14.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RNUrlRouter.h"

#pragma mark - runinMainThrad
void runBlockInMainThread(dispatch_block_t block){
  if (block == nil) {
    return;
  }
  if ([NSThread isMainThread]) {
    block();
  }
  else{
    dispatch_sync(dispatch_get_main_queue(), block);
  }
}

#pragma mark - runBlock
void runBlock(dispatch_block_t block) {
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

@implementation RNUrlRouter


- (void)callFunction:(NSString *)functionName token:(NSString *)token parameters:(NSDictionary *)parameters callback:(RCTResponseSenderBlock)callback {
  if ([functionName.lowercaseString isEqualToString:@"openurl"]) {
    [self openURL:parameters];
  }
}

#pragma mark - 不局限于形式，此处可以灵活运用

- (void)openURL:(NSDictionary *)parameters{
  NSString *urlString = parameters[@"url"];
  RCTAssert(urlString && urlString.length > 0,@"url can't be bull");
  runBlockInMainThread(^{
    BOOL success;// Custom url by your self，
    if (!success) {
      [[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlString]];
    }
  });
}
@end
