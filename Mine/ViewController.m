//
//  ViewController.m
//  Mine
//
//  Created by libin on 17/11/14.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "ViewController.h"
#import "FloatActionButton.h"
//#import <WebKit/WebKit.h>
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>
#import "DZNWebViewController.h"

@interface ViewController ()

@end
const NSInteger age1 = 42;
#define currentThread [NSThread currentThread]
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = @"title";
    
    
    FloatActionButton *button = [[FloatActionButton alloc]initWithFrame:CGRectMake(0.0, 64, 50, 50)];
    [self.view addSubview:button];
    return;
    button.floatBtnClickBlock = ^{
        UIViewController *vc = [[NSClassFromString(@"TestVCViewController") alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        return ;
        
        
      //  [self shareWebPageToPlatformType:UMSocialPlatformType_WechatSession];
        [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_Sina),@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_Qzone),@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatFavorite),@(UMSocialPlatformType_WechatTimeLine)]];
        
        [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
            // 根据获取的platformType确定所选平台进行下一步操作
            [self shareWebPageToPlatformType:platformType];
            //[self getUserInfoForPlatform:platformType];
        }];
    };
    
    
   

}

- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"农药走起" descr:@"GGG" thumImage:kAppIconImage];
    //设置网页地址
    shareObject.webpageUrl =@"https://game.weixin.qq.com/cgi-bin/comm/cltstat?pass_ticket=&Device=1&ActID=0&LogType=21&SceneID=23&GameID=wx95a3a4d7c627e07d&SourceID=1&UIArea=2301&PositionID=1&ActionID=22&ActionStatus=0&GiftID=0&GiftType=21&ConnectType=0&ISP=0&DeviceBrand=0&DeviceModel=0&OpType=2&allpath=&ClientVersion=6518&ExternInfo=%7B%22USERSTATUS%22%3A3%2C%22GAMESTATUS%22%3A0%7D&t=1512384137347";
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
            [BaseTools showAlertWithTitle:@"分享失败" message:nil vc:self trueBlock:nil cancelBlock:nil];
        }else{
            [BaseTools showAlertWithTitle:@"分享成功" message:nil vc:self trueBlock:nil cancelBlock:nil];
        }
    }];
}

- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
        
        UMSocialUserInfoResponse *resp = result;
        
        // 第三方登录数据(为空表示平台未提供)
        // 授权数据
        NSLog(@" uid: %@", resp.unionId);
        NSLog(@" openid: %@", resp.openid);
        NSLog(@" accessToken: %@", resp.accessToken);
        NSLog(@" refreshToken: %@", resp.refreshToken);
        NSLog(@" expiration: %@", resp.expiration);
        
        // 用户数据
        NSLog(@" name: %@", resp.name);
        NSLog(@" iconurl: %@", resp.iconurl);
        NSLog(@" gender: %@", resp.unionGender);
        
        // 第三方平台SDK原始数据
        NSLog(@" originalResponse: %@", resp.originalResponse);
    }];
}



@end
