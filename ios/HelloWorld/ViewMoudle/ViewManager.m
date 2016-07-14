//
//  ViewManager.m
//  HelloWorld
//
//  Created by Hao on 16/7/14.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "ViewManager.h"

@implementation ViewManager

+ (ViewManager*)shared {
  static ViewManager *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[ViewManager alloc] init];
  });
  return instance;
}

- (UINavigationController*)getNav {
  AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
  return (UINavigationController *)app.window.rootViewController;
}

- (void)showLoginViewController:(ResultBlock)resultBlock {
  NSLog(@"native");
  LoginViewController *loginVc = [[LoginViewController alloc]init];
  loginVc.resultBlock = resultBlock;
  [[self getNav]pushViewController:loginVc animated:YES];
}
@end
