//
//  ToolsMacros.h
//  Mine
//
//  Created by libin on 17/11/15.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//  宏定义头文件


#ifndef ToolsMacros_h
#define ToolsMacros_h

/** 主线程刷新UI  */
#define RefreshUI(_a) dispatch_async(dispatch_get_main_queue(), ^{_a;});

/** 硬件尺寸信息 */
#define kWidth      [UIScreen mainScreen].bounds.size.width
#define kHeight     [UIScreen mainScreen].bounds.size.height
#define kScaleWidth kWidth/320
#define isPad       [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad

/** 系统控件的默认高度 */
#define kSTATUS_BAR_H   [UIApplication sharedApplication].statusBarFrame.size.height
#define kNAV_BAR_H      (44.f)
#define kTAB_BAR_H      (kHeight == 812 ? 83 : 49)
#define kCELL_H         44*kScaleWidth

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

#define kBlackColor     [UIColor blackColor]      // 0.0 white
#define kDarkGrayColor  [UIColor darkGrayColor]   // 0.333 white
#define kLightGrayColor [UIColor lightGrayColor]  // 0.667 white
#define kWhiteColor     [UIColor whiteColor]      // 1.0 white
#define kGrayColor      [UIColor grayColor]       // 0.5 white
#define kRedColor       [UIColor redColor]        // 1.0, 0.0, 0.0 RGB
#define kGreenColor     [UIColor greenColor]      // 0.0, 1.0, 0.0 RGB
#define kBlueColor      [UIColor blueColor]       // 0.0, 0.0, 1.0 RGB
#define hCyanColor      [UIColor cyanColor]       // 0.0, 1.0, 1.0 RGB
#define hYellowColor    [UIColor yellowColor]     // 1.0, 1.0, 0.0 RGB
#define hMagentaColor   [UIColor magentaColor]    // 1.0, 0.0, 1.0 RGB
#define kOrangeColor    [UIColor orangeColor]     // 1.0, 0.5, 0.0 RGB
#define kPurpleColor    [UIColor purpleColor]     // 0.5, 0.0, 0.5 RGB
#define hBrownColor     [UIColor brownColor]      // 0.6, 0.4, 0.2 RGB
#define kClearColor     [UIColor clearColor]      // 0.0 white, 0.0 alpha


#define kBackgroundAlphatColor [UIColor colorWithWhite:0 alpha:0.3] //黑色半透明背景
#define kThemeColor     RGBColor(246, 110, 0)     // 主题色
#define kBgColor        RGBColor(243, 242,240)    // 页面背景色
#define kLineColor      RGBColor(198, 201, 201)   //线条颜色
#define kTextColor      RGBColor(56, 56, 56)      //字体颜色

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
