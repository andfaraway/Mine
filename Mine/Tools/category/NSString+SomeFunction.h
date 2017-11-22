//
//  NSString+SomeFunction.h
//  Mine
//
//  Created by libin on 17/11/15.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SomeFunction)

#pragma mark - 合法性校验
/** 邮箱验证  */
+ (BOOL)isValidateEmail:(NSString *)email;

/** 手机号码验证  */
+ (BOOL)isValidateMobile:(NSString *)mobile;

/** 车牌号验证  */
+ (BOOL)isValidateCarNumber:(NSString *)carNumber;

/** 身份证验证  */
+ (BOOL)isValidateCardID:(NSString *)strID;


/** 转换拼音  */
- (NSString *)transformToPinyin;

///MD5加密
+ (NSString *) MD5Digest:(NSString *)str;

@end
