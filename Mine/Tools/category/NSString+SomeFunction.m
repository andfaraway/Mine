//
//  NSString+SomeFunction.m
//  Mine
//
//  Created by libin on 17/11/15.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "NSString+SomeFunction.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (SomeFunction)

+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13，15(除154)，14，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(14[0,0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

+ (BOOL) isValidateCarNumber:(NSString *)carNumber
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:carNumber];
}

+ (BOOL)isValidateCardID:(NSString *)strID
{
    if (strID == nil) {
        return NO;
    }
    NSString *cardCheck = @"^[0-9]{17}[0-9|xX]{1}$";
    NSPredicate *cardTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",cardCheck];
    return [cardTest evaluateWithObject:strID];
}

//转换拼音
- (NSString *)transformToPinyin {
    if (self.length <= 0) {
        return self;
    }
    NSString *tempString = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)tempString, NULL, kCFStringTransformToLatin, false);
    tempString = (NSMutableString *)[tempString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    tempString = [tempString stringByReplacingOccurrencesOfString:@" " withString:@""];
    return [tempString uppercaseString];
}

+ (NSString *) MD5Digest:(NSString *)str {
    const char *cStr = [str UTF8String];
    //[str release];
    unsigned char result[16];
    CC_MD5( cStr, (unsigned int)strlen(cStr), result );
    NSString *resStr = [NSString stringWithFormat:
                        @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                        result[0], result[1], result[2], result[3],
                        result[4], result[5], result[6], result[7],
                        result[8], result[9], result[10], result[11],
                        result[12], result[13], result[14], result[15]
                        ];
    //结果为32位大写字母，转换成小写
    [resStr lowercaseString];
    return resStr;
}


@end
