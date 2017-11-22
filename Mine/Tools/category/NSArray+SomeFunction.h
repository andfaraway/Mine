//
//  NSArray+SomeFunction.h
//  Mine
//
//  Created by libin on 17/11/15.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SomeFunction)
/** 数组去重  */
- (instancetype)noRepeatArray;

/** Document保存数组  */
- (BOOL)savePlistDocumentDirWithName:(NSString *)fileName;

/** Document读取数组  */
+ (NSArray *)readPlistDocumentDirWithName:(NSString *)fileName;
@end
