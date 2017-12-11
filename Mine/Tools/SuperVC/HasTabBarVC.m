//
//  HasTabBarVC.m
//  Biyouxiu
//
//  Created by Macmini on 17/10/13.
//  Copyright © 2017年 cnmobi. All rights reserved.
//

#import "HasTabBarVC.h"

@interface HasTabBarVC ()
@end

@implementation HasTabBarVC
static BOOL isIPhoneX;//判断是否iPhone X
- (void)viewDidLoad
{
    [super viewDidLoad];
    //监听状态栏改变
    [[ NSNotificationCenter defaultCenter ] addObserver : self selector : @selector (statusBarFrameChanged) name : UIApplicationDidChangeStatusBarFrameNotification object : nil ];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([[[DeviceDataLibrery sharedLibrery]getDiviceName] containsString:@"iPhone X"] || (kHeight == 812)) {
        isIPhoneX = YES;
    }else{
        isIPhoneX = NO;
    }
    
    //显示tabBar(iphoneX判断)
    if (isIPhoneX) {
        self.tabBarController.tabBar.frame = CGRectMake(0, kHeight-83, kWidth, 83);
    }else{
        self.tabBarController.tabBar.frame = CGRectMake(0, kHeight-kTAB_BAR_H-(kSTATUS_BAR_H-20), kWidth, kTAB_BAR_H);;
    }

}


/** 监听状态栏改变  */
- (void)statusBarFrameChanged{
    //显示tabBar(iphoneX判断)
    if (isIPhoneX) {
        self.tabBarController.tabBar.frame = CGRectMake(0, kHeight-83, kWidth, 83);
    }else{
        self.tabBarController.tabBar.frame = CGRectMake(0, kHeight-kTAB_BAR_H-(kSTATUS_BAR_H-20), kWidth, kTAB_BAR_H);;
    }
}

- (void)dealloc{
    //监听状态栏改变
    [[ NSNotificationCenter defaultCenter ] removeObserver:self name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

@end
