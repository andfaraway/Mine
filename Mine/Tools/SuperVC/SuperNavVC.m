//
//  SuperNavVC.m
//
//
//  Created by apple on 15/5/18.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "SuperNavVC.h"

@interface SuperNavVC () <UINavigationControllerDelegate>

@end

@implementation SuperNavVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self useMethodToFindBlackLineAndHidden];//去除navigationbar下面的黑线

    
}

/** 防止跳转的控制器为nil  */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (!viewController) {
        viewController = [[UIViewController alloc]init];
        viewController.title  = @"未定义页面";
        viewController.view.backgroundColor = [UIColor whiteColor];
    }
    [super pushViewController:viewController animated:animated];
}

/** 当设置navigationBar的背景图片或背景色时，使用该方法都可移除黑线，且不会使translucent属性失效 */
-(void)useMethodToFindBlackLineAndHidden
{
    UIImageView* blackLineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    //隐藏黑线（在viewWillAppear时隐藏，在viewWillDisappear时显示）
    blackLineImageView.hidden = YES;
}
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

#pragma mark - 横竖屏相关

/// 是否支持旋转
- (BOOL)shouldAutorotate
{
//    Class class = self.topViewController.class;
//    NSLog(@"%@", class);
    return self.topViewController.shouldAutorotate;
}

/// 支持哪些方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.viewControllers.lastObject supportedInterfaceOrientations];
}

/// 优先显示的屏幕方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.viewControllers.lastObject preferredInterfaceOrientationForPresentation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
