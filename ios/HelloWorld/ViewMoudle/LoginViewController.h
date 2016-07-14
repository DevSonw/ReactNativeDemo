//
//  LoginViewController.h
//  HelloWorld
//
//  Created by Hao on 16/7/14.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ResultBlock)(NSString *key, NSDictionary *userInfo);

@interface LoginViewController : UIViewController

@property(nonatomic,strong)ResultBlock resultBlock;

@end
