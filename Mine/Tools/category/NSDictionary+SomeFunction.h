//
//  NSDictionary+SomeFunction.h
//  Mine
//
//  Created by libin on 17/11/15.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SomeFunction)
/** 词典转换为字符串  */
- (NSString*)DictionaryConversionStringOfJson;

/** 词典存取plist文件  */
+ (NSDictionary *)readPlistDocumentDirWithName:(NSString *)fileName;
- (BOOL)savePlistDocumentDirWithName:(NSString *)fileName;

- (NSDictionary *)deleteAllNullValue;
@end
