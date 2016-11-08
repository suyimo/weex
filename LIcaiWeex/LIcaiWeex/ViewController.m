//
//  ViewController.m
//  LIcaiWeex
//
//  Created by zhangshupeng on 2016/11/3.
//  Copyright © 2016年 sym. All rights reserved.
//

#import "ViewController.h"
#import <WeexSDK/WXSDKInstance.h>
@interface ViewController ()
@property (nonatomic, strong) WXSDKInstance *instance;
@property (nonatomic, strong) UIView *weexView;
@end

@implementation ViewController{
    NSURL *jsUrl;
}

- (instancetype)initWithJs:(NSString *)filePath
{
    self = [super init];
    if (self) {
        //远程js文件
        //        NSString *path=[NSString stringWithFormat:@"http://192.168.232.13:8080/examples/js/%@",filePath];
        //本地js文件
//        
        
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"js/main" ofType:@"js"];
        NSLog(@"-----path:%@",filePath);
        self.filePath = filePath;
        
    }
    return self;
}

- (void)setFilePath:(NSString *)filePath {
    _filePath = [filePath copy];
    jsUrl=[NSURL URLWithString:self.filePath];
}

//path:/Users/user/Library/Developer/CoreSimulator/Devices/5308F9A2-3D22-4B87-9203-DFCB449F5DF7/data/Containers/Bundle/Application/DBB5C299-086B-45C2-890F-E94F4136CD4D/LIcaiWeex.app/main.js
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    _instance.frame=self.view.frame;
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        [weakSelf.view addSubview:weakSelf.weexView];
    };
    _instance.onFailed = ^(NSError *error) {
        NSLog(@"加载错误");
    };
    
    _instance.renderFinish = ^ (UIView *view) {
        NSLog(@"加载完成");
    };
    if (!jsUrl) {
        return;
    }
    [_instance renderWithURL: jsUrl];
    self.view.backgroundColor=[UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_instance destroyInstance];
}

@end
