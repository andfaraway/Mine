//
//  LKeyChain.h
//  test
//
//  Created by ryt on 16/5/12.
//  Copyright © 2016年 aReu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LKeyChain : NSObject
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;
+ (NSString *)getDeviceId;
+ (NSString *)getIMEI;
@end
