//
//  RNRouter.h
//  HelloWorld
//
//  Created by Hao on 16/7/14.
//  Copyright © 2016年 Facebook. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "RCTBridgeModule.h"
#import "RCTAssert.h"
#import "RCTLog.h"
#import "RNRouteManager.h"

#define RNResult(s, k, v) [RNRouter RNResultWithStatusCode:(s) methodName:(k) errorDesc:(v)]

@interface RNRouter : NSObject

@property (nonatomic, weak) RCTBridge *bridge;

@property (nonatomic, weak) UIViewController *viewController;

+ (void)callModule:(NSString *)moduleName
          function:(NSString *)functionName
             token:(NSString*)token
        parameters:(NSDictionary *)parameters
            bridge:(RCTBridge *)bridge
          callback:(RCTResponseSenderBlock)callback;

- (void)callFunction:(NSString *)functionName
               token:(NSString*)token
          parameters:(NSDictionary *)parameters
            callback:(RCTResponseSenderBlock)callback;

+ (NSDictionary *)RNResultWithStatusCode:(int)statusCode
                              methodName:(NSString *)methodName
                               errorDesc:(NSString *)errorDesc;

@end