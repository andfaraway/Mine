//
//  MineNetworkTool.m
//  Mine
//
//  Created by libin on 17/11/24.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "MineNetworkTool.h"



//网络超时时间
#define HTTP_TIMEOUT 60

@implementation MineNetworkTool
static  MineNetworkTool *_MineNetworkTool = nil;

#pragma mark - 单例初始化
+ (instancetype)shareTool{
    return [[self alloc] init];
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _MineNetworkTool = [super allocWithZone:zone];
    });
    return _MineNetworkTool;
}
- (instancetype)init{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _MineNetworkTool = [super init];
    });
    return _MineNetworkTool;
}


//AFNetworking内存泄露，将获取manager改为单例获取
static AFHTTPSessionManager *manager;

-(AFHTTPSessionManager *)sharedHttpSessionManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = HTTP_TIMEOUT;
    });
    return manager;
}


#pragma mark - JSON方式get提交数据
- (void)getJSONWithUrl:(NSString *)urlStr parameters:(id)parameters block:(void(^)(NSDictionary *responseDic, NSError *error))block
{
    AFHTTPSessionManager *manager = [self sharedHttpSessionManager];
    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    NSString *url = urlStr;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求出错");
    }];
}


- (void)tianyinWithUrl:(NSString *)url withParams:(NSDictionary *)params block:(void(^)(NSDictionary *responseDic, NSError *error))block{

//    NSURL *urlStr=[NSURL URLWithString:url];//创建URL
//    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:urlStr];//通过URL创建网络请求
//    [request setTimeoutInterval:30];//设置超时时间
//    [request setHTTPMethod:@"GET"];//设置请求方式
//    NSError *err;
//    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err];
//    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//    
//    NSLog(@"\n string:%@\n",str);
//    return;
    [self getJSONWithUrl:url parameters:params block:^(NSDictionary *responseDic, NSError *error) {
        if (block) {
            block(responseDic,error);
        }
    }];
}

@end
