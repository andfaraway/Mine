//
//  LKeyChain.m
//  test
//
//  Created by ryt on 16/5/12.
//  Copyright © 2016年 aReu. All rights reserved.
//

#import "LKeyChain.h"

@implementation LKeyChain
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}

+ (void)save:(NSString *)service data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

+ (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

+ (void)delete:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}

/** 获取（伪）IMEI  */
+ (NSString *)getIEMI
{
    NSMutableString *UUID= [NSMutableString stringWithString:[self getDeviceId]];
    NSMutableString *IMEI = [NSMutableString new];
    NSInteger count = 0;
    //选出15位数字
    for (int i = 0; i<UUID.length; i++) {
        char c = [UUID characterAtIndex:i];
        if (c>='0' &&c<='9') {
            [IMEI appendFormat:@"%c",c];
            count++;
        }
        if (count > 14) {
            break;
        }
    }
    while (IMEI.length<15) {
        [IMEI appendString:@"0"];
    }
    //    NSLog(@"IEMI=%@",IEMI);
    return IMEI;
}


/** 获取uuid  */
+ (NSString *)getDeviceId
{
    NSDictionary *data = [LKeyChain load:@"byxuuid"];
    NSString *currentUUIDStr;
    if (!data) {
        currentUUIDStr = [[[UIDevice currentDevice].identifierForVendor UUIDString] stringByReplacingOccurrencesOfString:@"-" withString:@""];
        [LKeyChain save:@"byxuuid" data:@{@"uuid":currentUUIDStr}];
    }
    else
    {
        currentUUIDStr = [data objectForKey:@"uuid"];
    }
    return currentUUIDStr;
}

@end
