//
//  WXEventModule.m
//  LIcaiWeex
//
//  Created by zhangshupeng on 2016/11/7.
//  Copyright © 2016年 sym. All rights reserved.
//





#import "WXEventModule.h"
#import "ViewController.h"
#import <WeexSDK/WXBaseViewController.h>

@implementation WXEventModule

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(openURL:))

- (void)openURL:(NSString *)url
{
    NSString *newURL = url;
    if ([url rangeOfString:@"local://"].length > 0) {
        NSString *path=[NSString stringWithFormat:@"file://%@/js/%@",[NSBundle mainBundle].bundlePath,[[url componentsSeparatedByString:@"local://"] lastObject]];
        newURL = path;
    }else
    if ([url hasPrefix:@"//"]) {
        newURL = [NSString stringWithFormat:@"http:%@", url];
    } else if (![url hasPrefix:@"http"]) {
        // relative path
        newURL = [NSURL URLWithString:url relativeToURL:weexInstance.scriptURL].absoluteString;
    }
    
    UIViewController *controller = [[ViewController alloc] init];
    ((ViewController *)controller).filePath = newURL;
    
    [[weexInstance.viewController navigationController] pushViewController:controller animated:YES];
}

@end
