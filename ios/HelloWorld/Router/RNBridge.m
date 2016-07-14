//
//  RNBridge.m
//  HelloWorld
//
//  Created by Hao on 16/7/14.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "RNBridge.h"
#import "RNRouter.h"

@implementation RNBridge
@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();
RCT_REMAP_METHOD(callNative,
                 callModule:(NSString *)moduleName
                 function:(NSString *)functionName
                 token:(NSString*)token
                 parameters:(NSDictionary *)parameters)
{
  [RNRouter callModule:moduleName
              function:functionName
                token:token
           parameters:parameters
               bridge:self.bridge
             callback:nil];
}

RCT_REMAP_METHOD(callNativeWithCallback,
                 callModule:(NSString *)moduleName
                 function:(NSString *)functionName
                 token:(NSString*)token
                 parameters:(NSDictionary *)parameters
                 callback:(RCTResponseSenderBlock)callback)
{
  [RNRouter  callModule:moduleName
                function:functionName
                   token:token
              parameters:parameters
                  bridge:self.bridge
                callback:callback];
}
@end

