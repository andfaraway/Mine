//
//  NSDictionary+SomeFunction.m
//  Mine
//
//  Created by libin on 17/11/15.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "NSDictionary+SomeFunction.h"

@implementation NSDictionary (SomeFunction)
- (NSString*)DictionaryConversionStringOfJson

{
    if (!self) {
        return nil;
    }
    
    NSError *parseError;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    
    if (parseError) {
        return nil;
    }
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}

+ (NSDictionary *)readPlistDocumentDirWithName:(NSString *)fileName{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    DEBUGLog(@"读取%@,路径为:\n%@",fileName,filePath);
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dict;
}

- (BOOL)savePlistDocumentDirWithName:(NSString *)fileName {
    
    NSArray *keyArr = self.allKeys;
    NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
    for (NSString *keyStr in keyArr) {
        if ((self[keyStr] != [NSNull null]) && self[keyStr]) {
            [tempDict setObject:self[keyStr] forKey:keyStr];
        }
    }
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager createFileAtPath:filePath contents:nil attributes:nil] == YES) {
        [tempDict writeToFile:filePath atomically:NO];
        DEBUGLog(@"保存%@成功,路径为:\n%@",fileName,filePath);
        return YES;
    }
    return NO;
}

- (NSDictionary *)deleteAllNullValue{
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    for (NSString *keyStr in self.allKeys) {
        id object = [self objectForKey:keyStr];
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *nonNullDic = [object deleteAllNullValue];
            [mutableDic setObject:nonNullDic forKey:keyStr];
        }
        else if ([object isEqual:[NSNull null]]) {
            [mutableDic setObject:@"" forKey:keyStr];
        }
        else{
            [mutableDic setObject:object forKey:keyStr];
        }
    }
    return mutableDic;
}
@end
