//
//  TabBarVC.m
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//
#import "TabBarVC.h"
#import "AccountVC.h"

@interface TabBarVC () <UITabBarControllerDelegate>

@end

@implementation TabBarVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIViewController *vc0 = [NSClassFromString(@"ViewController") new];
    UIViewController *vc1 = [UIViewController new];
    UIViewController *vc2 = [UIViewController new];
    UIViewController *vc3 = [AccountVC new];
    
    SuperNavVC *nav0 = [[SuperNavVC alloc] initWithRootViewController:vc0];
    SuperNavVC *nav1 = [[SuperNavVC alloc] initWithRootViewController:vc1];
    SuperNavVC *nav2 = [[SuperNavVC alloc] initWithRootViewController:vc2];
    SuperNavVC *nav3 = [[SuperNavVC alloc] initWithRootViewController:vc3];
    
    self.viewControllers = @[nav0, nav1, nav2,nav3];
    
    /// 自定义标签栏
    [self setTabBarItems];
}

/// 自定义标签栏
- (void)setTabBarItems
{
    UITabBar *tabbar = self.tabBar;
    tabbar.backgroundImage = [[UIImage imageNamed:@"nav_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
    tabbar.shadowImage = [UIImage new];
    
    NSArray *titleArray = @[NSLocalizedString(@"发现音乐", nil),
                            NSLocalizedString(@"我的音乐", nil),
                            NSLocalizedString(@"朋友", nil),
                            NSLocalizedString(@"账号", nil)];
    NSArray *imageArr0  = @[@"icon_black", @"menu_black", @"oclock_black",@"man_black"];
    NSArray *imageArr1  = @[@"icon_black", @"menu_black", @"oclock_black",@"man_black"];
    
    for(int i = 0; i < self.viewControllers.count; i++)
    {
        UINavigationController *one = (UINavigationController *)[self.viewControllers objectAtIndex:i];
        
        /// 设置选中、未选中时的图标
        UIImage *image0 = ImageNamed([imageArr0 objectAtIndex:i]); // 未选中 时图片
        UIImage *image1 = ImageNamed([imageArr1 objectAtIndex:i]); //  选中 时图片
        
        /// 声明这张图片用原图(别渲染)
        image0 = [image0 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        image1 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        /// 新增按钮
        one.tabBarItem = [[UITabBarItem alloc]initWithTitle:[titleArray objectAtIndex:i] image:image0 selectedImage:image1];
        
        /// 设置两种状态下的图片
//        [one.tabBarItem setFinishedSelectedImage:selectedImage withFinishedUnselectedImage:image];
        
        /// 设置常态下文字的颜色
        [one.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor lightGrayColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateNormal];
        
        /// 设置选中时文字的颜色
        [one.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor redColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateSelected];
        
        one.tabBarItem.tag = i;
        
        [one.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];//字体位置
//        if (i == 2)
//        {
//            one.tabBarItem.imageInsets = UIEdgeInsetsMake(-14, 0, 14, 0); //设置图片居中，注意这里的两个值14，-14
//        }
        self.tabBar.tintColor = [UIColor redColor];
//        self.tabBar.clipsToBounds = YES;
    }
}


#pragma mark - 横竖屏

/// 是否支持旋转
- (BOOL)shouldAutorotate
{
//    Class class = self.selectedViewController.class;
//    NSLog(@"%@", class);
    return [self.selectedViewController shouldAutorotate];
}

/// 支持哪些方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.selectedViewController supportedInterfaceOrientations];
}

/// 优先显示的屏幕方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
