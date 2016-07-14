//
//  ViewManager.h
//  HelloWorld
//
//  Created by Hao on 16/7/14.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "LoginViewController.h"

@interface ViewManager : NSObject

+ (ViewManager*)shared;

- (UINavigationController*)getNav;

- (void)showLoginViewController:(ResultBlock)resultBlock;

@end
