//
//  RNRouter.m
//  HelloWorld
//
//  Created by Hao on 16/7/14.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RNRouter.h"
#import "RCTUtils.h"
#import "RCTRootView.h"

@implementation RNRouter

+ (void)callModule:(NSString *)moduleName
          function:(NSString *)functionName
             token:(NSString*)token
        parameters:(NSDictionary *)parameters
            bridge:(RCTBridge *)bridge
          callback:(RCTResponseSenderBlock)callback {
  RCTAssert(moduleName, @"module name can't be null.");
  RCTAssert(functionName, @"function name can't be null.");
  NSString *moduleClassName = [[@"RN" stringByAppendingString:moduleName] stringByAppendingString:@"Router"];
  Class cls = NSClassFromString(moduleClassName);
  RNRouter *object = [[cls alloc] init];
  object.bridge = bridge;
  RCTAssert([cls isSubclassOfClass:self], @"can not find the class, module name may be incorrect.");
  [object callFunction:functionName  token:token parameters:parameters callback:callback];
}

- (void)callFunction:(NSString *)functionName
               token:(NSString*)token
          parameters:(NSDictionary *)parameters
            callback:(RCTResponseSenderBlock)callback {
  //subclass override.
}

- (UIViewController *)viewController {
  if (_viewController) {
    return _viewController;
  } else {
    return [[self class] visibleViewController];
  }
}

+ (UINavigationController *)visibleNavigationController {
  UIViewController *controller = RCTKeyWindow().rootViewController;
  while (controller.presentedViewController) {
    controller = controller.presentedViewController;
  }
  if ([controller isKindOfClass:[UINavigationController class]]) {
    return (UINavigationController*)controller;
  }
  else if ([controller isKindOfClass:[UIViewController class]]) {
    return controller.navigationController;
  }
  
  return nil;
}

+ (UIViewController *)visibleViewController {
  return [RNRouter visibleNavigationController].visibleViewController;
}

+ (NSDictionary *)RNResultWithStatusCode:(int)statusCode
                              methodName:(NSString *)methodName
                               errorDesc:(NSString *)errorDesc {
  NSMutableDictionary *statusDict = [NSMutableDictionary dictionary];
  [statusDict setValue:[NSNumber numberWithInt:statusCode]  forKey:@"status"];
  [statusDict setValue:methodName forKey:@"function"];
  if (statusCode != 0 && errorDesc == nil) {
    NSAssert(false, @"StatusCode!=0, 请提供Error 描述!");
  }
  
  if (statusCode != 0 && errorDesc.length > 0) {
    [statusDict setValue:errorDesc forKey:@"errorDesc"];
  }
  
  return statusDict;
}

- (void)setBridge:(RCTBridge *)bridge {
  if (bridge && [bridge isKindOfClass:[RCTBridge class]]) {
    if (bridge.delegate && [bridge.delegate isKindOfClass:[RCTRootView class]]) {
      RCTRootView *view  = (RCTRootView *)bridge.delegate;
      self.viewController = view.reactViewController;
    }
  }
  _bridge = bridge;
}
@end

