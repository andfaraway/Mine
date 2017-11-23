//
//  ToolsMacros.h
//  Mine
//
//  Created by libin on 17/11/15.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//  宏定义头文件


#ifndef ToolsMacros_h
#define ToolsMacros_h

/** 硬件尺寸信息 */
#define kWidth      [UIScreen mainScreen].bounds.size.width
#define kHeight     [UIScreen mainScreen].bounds.size.height
#define kScaleWidth kWidth/375.0
#define isPad       [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad

/** 系统控件的默认高度 */
#define kSTATUS_BAR_H   (20.f)
#define kNAV_BAR_H      (44.f)
#define kTAB_BAR_H      (49.f)
#define kCELL_H         (44.f)

/** 中英状态下键盘的高度 */
#define kEN_KEY_BOARD_H  (216.f)
#define kCH_KEY_BOARD_H  (252.f)


/** 常用宏定义 */
#define kUserDefaults               [NSUserDefaults standardUserDefaults]
#define kNotificationCenter         [NSNotificationCenter defaultCenter]
#define kApplication                [UIApplication sharedApplication]
#define kAppDelegate                (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define kWindow                     [[UIApplication sharedApplication] keyWindow]
#define kFileManager                [NSFileManager defaultManager]
#define kDevice                     [UIDevice currentDevice]
#define kBundle                     [NSBundle mainBundle]
#define kInfoDictionary             [[NSBundle mainBundle] infoDictionary]
#define kDocumentPath               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kBundleLoadNibName(name)    [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] lastObject]


/** APP版本号 */
#define kAppVersion         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/** APP Build 版本号 (每次打包时递增 +1) */
#define kAppBuildVersion    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
/** APP名字 */
#define kAppDisplayName     [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]
/** APPIcon  */
#define kAppIconImage       [UIImage imageNamed:[[[[NSBundle mainBundle] infoDictionary]valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject]]

/** 当前语言 */
#define kAppLocalLanguage   [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode]
/** 当前国家 */
#define kAppLocalCountry    [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]





/** 颜色相关  */
#define RGBColor(_r, _g, _b)        [UIColor colorWithRed:(_r)/255.0 green:(_g)/255.0 blue:(_b)/255.0 alpha:1.0f]
#define RGBColor_a(_r, _g, _b, _a)  [UIColor colorWithRed:(_r)/255.0 green:(_g)/255.0 blue:(_b)/255.0 alpha:_a]
#define RGBColor_f(_f)              [UIColor colorWithRed:((float)((_f & 0xFF0000) >> 16))/255.0 green:((float)((_f & 0xFF00)>> 8))/255.0 blue:((float) (_f & 0xFF))/255.0 alpha:1.0f]

#define kBackgroundAlphatColor [UIColor colorWithWhite:0 alpha:0.3] //黑色半透明背景


/** 加载图片 */
#define ImageNamed(_name)       [UIImage imageNamed:_name]


/*****************  NSLog  ******************/
#if DEBUG
#define DEBUGLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);//DEBUGLog(s) NSLog(@"%@",s)
//#define DEBUGLog(...)//屏蔽日志
#else
#define DEBUGLog(...)
#endif


#endif /* ToolsMacros_h */
