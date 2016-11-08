//
//  ViewController.h
//  LIcaiWeex
//
//  Created by zhangshupeng on 2016/11/3.
//  Copyright © 2016年 sym. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (instancetype)initWithJs:(NSString *)filePath;

@property (nonatomic, copy) NSString *filePath;

@end

