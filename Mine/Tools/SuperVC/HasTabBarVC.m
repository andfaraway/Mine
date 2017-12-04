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

- (void)viewDidLoad
{
    [super viewDidLoad];
    //监听状态栏改变
    [[ NSNotificationCenter defaultCenter ] addObserver : self selector : @selector (statusBarFrameChanged) name : UIApplicationDidChangeStatusBarFrameNotification object : nil ];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //显示tabBar
    self.tabBarController.tabBar.frame = CGRectMake(0, kHeight-kTAB_BAR_H-(kSTATUS_BAR_H-20), kWidth, kTAB_BAR_H);;
}


/** 监听状态栏改变  */
- (void)statusBarFrameChanged{
      self.tabBarController.tabBar.frame = CGRectMake(0, kHeight-kTAB_BAR_H-(kSTATUS_BAR_H-20), kWidth, kTAB_BAR_H);;
}

- (void)dealloc{
    //监听状态栏改变
    [[ NSNotificationCenter defaultCenter ] removeObserver:self name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}

@end
