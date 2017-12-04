//
//  MineNetworkTool.h
//  Mine
//
//  Created by libin on 17/11/24.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineNetworkTool : NSObject
/** 获取单例  */
+ (instancetype)shareTool;

- (void)tianyinWithUrl:(NSString *)url withParams:(NSDictionary *)params block:(void(^)(NSDictionary *responseDic, NSError *error))block;
@end
