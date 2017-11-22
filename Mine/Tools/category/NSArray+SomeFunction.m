//
//  NSArray+SomeFunction.m
//  Mine
//
//  Created by libin on 17/11/15.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "NSArray+SomeFunction.h"

@implementation NSArray (SomeFunction)

- (instancetype)noRepeatArray {
    return [self newArrayWithArray:self.mutableCopy];
}

- (NSMutableArray *)newArrayWithArray:(NSMutableArray *)array {
    
    NSMutableArray *newArray = [NSMutableArray new];
    
    for (unsigned i = 0; i < [array count]; i++) {
        if (![newArray containsObject:array[i]]) {
            [newArray addObject:array[i]];
        }
    }
    return newArray;
}

+ (NSArray *)readPlistDocumentDirWithName:(NSString *)fileName{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    DEBUGLog(@"读取%@,路径为:\n%@",fileName,filePath);
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    return array;
}

- (BOOL)savePlistDocumentDirWithName:(NSString *)fileName {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager createFileAtPath:filePath contents:nil attributes:nil] == YES) {
        [self writeToFile:filePath atomically:NO];
        DEBUGLog(@"保存%@成功,路径为:\n%@",fileName,filePath);
        return YES;
    }
    return NO;
}

@end
