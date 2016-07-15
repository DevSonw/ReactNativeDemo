//
//  LoginViewController.m
//  HelloWorld
//
//  Created by Hao on 16/7/14.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

-(void)viewDidLoad {
  self.view.backgroundColor = [UIColor whiteColor];
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  button.frame = CGRectMake(100, 100, 100, 50);
  button.backgroundColor = [UIColor grayColor];
  [button setTitle:@"登录" forState:UIControlStateNormal];
  [button addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
}

-(void)loginBtnClick:(id)sender {
  BOOL success = YES;
  if (success) {
    [self.navigationController popViewControllerAnimated:YES];
    self.resultBlock(@"login.success",@{@"msg":@"successInfo"});
  }
}

@end
