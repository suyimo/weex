//
//  WXEventModule.h
//  LIcaiWeex
//
//  Created by zhangshupeng on 2016/11/7.
//  Copyright © 2016年 sym. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WXEventModuleProtocol.h>
#import <WeexSDK/WXModuleProtocol.h>

@interface WXEventModule : NSObject <WXEventModuleProtocol, WXModuleProtocol>

@end
