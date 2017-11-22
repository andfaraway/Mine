//
//  BaseTools.h
//  Mine
//
//  Created by libin on 17/11/17.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToolsMacros.h"
#import "ToolsCategory.h"

@interface BaseTools : NSObject

/** 截屏  */
+ (UIImage *)screenCapture:(UIView *)view;

/** 请求访问相机  */
+(NSInteger )vistVideo;

/** 拨打电话  */
+ (void)phoneWithNum:(NSString *)num;

/** 获取一个非空字符串  */
+ (NSString *)getNoEmptyStr:(NSString *)str;

/** 时间戳转时间  */
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;

/** 时间转时间戳  */
+ (long)timeIntergerWithDate:(NSDate *)date;

/** 返回固定格式字符串  */
+ (NSString *)timeWithDate:(NSDate *)date withFormatter:(NSString *)formatterString;

#pragma mark - view相关
/** 将view弹至中间  */
+ (void)popCenterViewOnFullScreen:(UIView *)view animated:(BOOL)animated;

/** 获取当前屏幕显示的viewcontroller  */
+ (UIViewController *)getCurrentVC;

/** 一个按钮的alert框  */
+ (void)showAlertWithTitle:(NSString *)title vc:(UIViewController *)vc trueBlock:(void(^)())trueBlock cancelBlock:(void(^)())cancelBlock;

/** 结束刷新  */
+ (void)endMJReflash:(UITableView *)tableView;

/** 是否有访问相机权限  */
+(BOOL)canVistVideo;

/** 是否有访问相册权限  */
+(BOOL)canVistPhotos;

/** 跳转隐私设置  */
+ (void)jumpSystemSetting;
@end
