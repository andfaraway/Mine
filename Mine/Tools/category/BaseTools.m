//
//  BaseTools.m
//  Mine
//
//  Created by libin on 17/11/17.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "BaseTools.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreLocation/CoreLocation.h>
#import <Photos/Photos.h>

@implementation BaseTools
/* 截屏 */
+ (UIImage *)screenCapture:(UIView *)view
{
    UIView *screenView = view;
    UIGraphicsBeginImageContextWithOptions(screenView.frame.size, NO, 0.0); //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    [screenView.layer renderInContext:UIGraphicsGetCurrentContext()];//renderInContext呈现接受者及其子范围到指定的上下文
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
    UIGraphicsEndImageContext();//移除栈顶的基于当前位图的图形上下文
    NSLog(@"截屏成功");
    return image;
}


/** 判断是否为有效的png，JPG图片 */
+ (BOOL)isValidPNGOrJPGImageData:(NSData *)imageData
{
    UIImage *image = [UIImage imageWithData:imageData];
    if (imageData == nil && image == nil) {
        return NO;
    }
    
    NSData *tempData = UIImagePNGRepresentation(image);
    if (tempData == nil) {
        tempData = UIImageJPEGRepresentation(image, 1);
        if (tempData == nil) {
            return NO;
        }else{
            return YES;
        }
    }else{
        return YES;
    }
}

/** 请求相机权限  */
+(NSInteger)vistVideo
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatus == AVAuthorizationStatusAuthorized)
    {
        NSLog(@"允许状态");
        return 1;
    }
    else if (authStatus == AVAuthorizationStatusDenied)
    {
        NSLog(@"不允许状态，可以弹出一个alertview提示用户在隐私设置中开启权限");
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告" message:@"请在“设置-隐私-相机”中允许发现精彩访问相机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        });
        return -1;
    }
    else if (authStatus == AVAuthorizationStatusNotDetermined)
    {
        NSLog(@"系统还未知是否访问，第一次开启相机时");
        return 0;
    }
    else
    {
        return 0;
    }
}

/** 拨打电话 */
+ (void)phoneWithNum:(NSString *)num
{
    NSString *urlStr = [NSString stringWithFormat:@"tel://%@", num];
    if (kDevice.systemVersion.floatValue < 10) {
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString:urlStr]];
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr] options:@{} completionHandler:nil];
    }
}

/** 获取一个非空字符串  */
+ (NSString *)getNoEmptyStr:(NSString *)str{
    if ([str isKindOfClass:[NSNumber class]]) {
        str = [NSString stringWithFormat:@"%@",str];
        return str;
    }
    if ([str isKindOfClass:[NSNull class]] || str == nil) {
        str = @"";
        return str;
    }
    
    if ([str isKindOfClass:[NSString class]]) {
        if(([str length] < 1 || [str isEqualToString:@"(null)"] || [str isEqualToString:@"null"])){
            return @"";
        }else{
            return str;
        }
    }else{
        return str;
    }
}


/** 推出一个view到屏幕中心  */
+ (void)popCenterViewOnFullScreen:(UIView *)view animated:(BOOL)animated {
    
    UIView *_bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    _bgView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.000];
    
    CGFloat halfScreenWidth = [[UIScreen mainScreen] bounds].size.width * 0.5;
    CGFloat halfScreenHeight = [[UIScreen mainScreen] bounds].size.height * 0.4;
    
    CGPoint screenCenter = CGPointMake(halfScreenWidth, halfScreenHeight);
    view.center = screenCenter;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:_bgView];
    [_bgView addSubview:view];
    
    //给父视图添加手势
    UITapGestureRecognizer *reg = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [_bgView addGestureRecognizer:reg];
    
    if (animated) {
        // 将view宽高缩至无限小（点）
        view.transform = CGAffineTransformScale(CGAffineTransformIdentity, CGFLOAT_MIN, CGFLOAT_MIN);
        [UIView animateWithDuration:0.3 animations:^{
            
            _bgView.backgroundColor = kBackgroundAlphatColor;
            view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                // 以动画的形式将view恢复至原始大小
                view.transform = CGAffineTransformIdentity;
            }];
        }];
    }
}

+ (void)tap:(UITapGestureRecognizer *)reg {
    UIView *view = reg.view;
    [view removeFromSuperview];
}

/** 时间戳转换成时间格式 */
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/** 时间转时间戳  */
+ (long)timeIntergerWithDate:(NSDate *)date{
    long firstStamp = [date timeIntervalSince1970];
    return firstStamp;
}


/**
 返回固定格式时间字符串
 
 @param date 时间
 @param formatterString 格式：YYYY-MM-dd
 @return string
 */
+ (NSString *)timeWithDate:(NSDate *)date withFormatter:(NSString *)formatterString{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatterString];
    
    return [formatter stringFromDate:date];
}

/** 获取当前屏幕显示的viewcontroller  */
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

+ (void)showAlertWithTitle:(NSString *)title vc:(UIViewController *)vc trueBlock:(void(^)())trueBlock cancelBlock:(void(^)())cancelBlock{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (trueBlock) {
            trueBlock();
        }
    }];
    [alert addAction:action];
    if (cancelBlock) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            cancelBlock();
        }];
        [alert addAction:cancelAction];
    }
    
    [vc presentViewController:alert animated:YES completion:nil];
}

+ (void)endMJReflash:(UITableView *)tableView{
    if (tableView == nil) {//若没有传tableview，则自己获取
        UIViewController *vc = [self getCurrentVC];
        UITableView *tableView = [vc.view viewWithTag:666];
        if (tableView.mj_header.isRefreshing) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [tableView.mj_header endRefreshing];
            });
        }
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (tableView.mj_header.isRefreshing) {
                [tableView.mj_header endRefreshing];
            }
        });
    }
}

/** 请求相机权限  */
+ (BOOL)canVistVideo
{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(authStatus == AVAuthorizationStatusAuthorized)
    {
        NSLog(@"允许状态");
        return YES;
    }
    else if (authStatus == AVAuthorizationStatusDenied)
    {
        NSLog(@"不允许状态，可以弹出一个alertview提示用户在隐私设置中开启权限");
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showAlertWithTitle:@"请允许访问相机" vc:[self getCurrentVC] trueBlock:^{
                [self jumpSystemSetting];
            } cancelBlock:^{
                
            }];
        });
        return NO;
    }
    else if (authStatus == AVAuthorizationStatusNotDetermined)
    {
        NSLog(@"系统还未知是否访问，第一次开启相机时");
        return YES;
    }
    else
    {
        return NO;
    }
}


/** 请求访问相册权限  */
+ (BOOL)canVistPhotos
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
        ALAuthorizationStatus author =[ALAssetsLibrary authorizationStatus];
        if (author == kCLAuthorizationStatusRestricted || author == kCLAuthorizationStatusDenied) {
            //无权限
            dispatch_async(dispatch_get_main_queue(), ^{
                [self showAlertWithTitle:@"请允许访问相册" vc:[self getCurrentVC] trueBlock:^{
                    [self jumpSystemSetting];
                } cancelBlock:^{
                    
                }];
            });
            
            return NO;
        }
    }
    else {
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if (status == PHAuthorizationStatusRestricted ||
            status == PHAuthorizationStatusDenied) {
            //无权限
            dispatch_async(dispatch_get_main_queue(), ^{
                [self showAlertWithTitle:@"请允许访问相册" vc:[self getCurrentVC] trueBlock:^{
                    [self jumpSystemSetting];
                } cancelBlock:^{
                    
                }];
            });
            
            return NO;
        }
    }
    return YES;
    
}

/** 跳转隐私设置  */
+ (void)jumpSystemSetting{
    NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if([[UIApplication sharedApplication] canOpenURL:url]) {
        NSURL *url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if (kDevice.systemVersion.floatValue < 10) {
            [[UIApplication sharedApplication] openURL:url];
        }else{
            [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:nil];
        }
    }
}


@end
