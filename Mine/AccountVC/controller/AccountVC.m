//
//  AccountVC.m
//  Mine
//
//  Created by libin on 2017/12/8.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "AccountVC.h"
#import "AccountMessageCell.h"
#import "SystemSettingsCell.h"
#import "AccountMessageNoLoginCell.h"
#import "AccountModel.h"
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>


@interface AccountVC ()
@property(nonatomic,strong)NSDictionary *titleInfo;
@property(nonatomic,strong)AccountModel *model;
@end


static NSString *const messageCell = @"messageCell";
static NSString *const noLoginCell = @"noLoginCell";
static NSString *const settingCell = @"systemSettingCell";
static NSString *const justCell = @"cell";

@implementation AccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账号";
    [self getInfo];
    [self initTableView];
}

- (void)getInfo{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"AccountVC" ofType:@"plist"];
    _titleInfo = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    _model = [AccountModel new];
    _model.name = [[NSUserDefaults standardUserDefaults]valueForKey:@"name"];
    _model.iconurl = [[NSUserDefaults standardUserDefaults]valueForKey:@"iconurl"];
}

- (void)initTableView{
    [super initTableView];
    [self.tableView registerClass:[AccountMessageCell class] forCellReuseIdentifier:messageCell];
    [self.tableView registerClass:[AccountMessageNoLoginCell class] forCellReuseIdentifier:noLoginCell];
    [self.tableView registerClass:[SystemSettingsCell class] forCellReuseIdentifier:settingCell];
     [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:justCell];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    bool islogin = [[NSUserDefaults standardUserDefaults]boolForKey:kIsLogin];
    if (islogin) {
        return 6;
    }else{
        return 5;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0: case 1:
            return 1;
            break;
        case 2:
            return 3;
            break;
        case 3:
            return 7;
            break;
        case 4:
            return 2;
            break;
        default:
            return 1;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 146*kScaleWidth;
    }else{
        return kCELL_H;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        bool islogin = [[NSUserDefaults standardUserDefaults]boolForKey:kIsLogin];
        if (islogin) {
            AccountMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:messageCell];
            cell.model = self.model;
            return cell;
        }else{
            AccountMessageNoLoginCell *cell = [tableView dequeueReusableCellWithIdentifier:noLoginCell];
            cell.loginBlock = ^{
                [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_QQ),@(UMSocialPlatformType_Sina),@(UMSocialPlatformType_WechatSession)]];
                
                [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
                    [self getUserInfoForPlatform:platformType];
                }];
                 
            };
            return cell;
        }
    }else if (indexPath.section == 5){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:justCell];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.textColor = kRedColor;
        cell.textLabel.text = @"退出登录";
        return cell;
    }else{
        NSArray *arr = [_titleInfo objectForKey:[NSString stringWithFormat:@"section%zd",indexPath.section]];
        NSDictionary *dic = [arr objectAtIndex:indexPath.row];
        UIImage *image = [UIImage imageNamed:[dic objectForKey:@"icon"]];
        NSString *title = [dic objectForKey:@"title"];
        
        SystemSettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:settingCell];
        cell.imageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        cell.textLabel.text = title;
        cell.imageView.tintColor = [UIColor colorWithHexString:@"#979797"];
        cell.textLabel.font = [UIFont italicSystemFontOfSize:15*kScaleWidth];
        
        if ((indexPath.section == 1) || (indexPath.section == 2 && indexPath.row == 2) || (indexPath.section == 3 && indexPath.row == 6) || (indexPath.section == 4 && indexPath.row == 1)) {
            cell.line.hidden = YES;
        }else {
            cell.line.hidden = NO;
        }
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 5) {
        [BaseTools showAlertWithTitle:@"网易云音乐" message:@"确定退出当前账号吗？" vc:self trueBlock:^{
            [[NSUserDefaults standardUserDefaults]setBool:NO forKey:kIsLogin];
            RefreshUI([tableView reloadData];)
        } cancelBlock:^{
        }];
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10*kScaleWidth;
}


//显示nav下面黑线
- (void)useMethodToFindBlackLineAndHidden{
}


//登录列表
- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
        if (error == nil) {
            //授权成功
            UMSocialUserInfoResponse *resp = result;
            _model.name = resp.name;
            _model.iconurl = resp.iconurl;
            [[NSUserDefaults standardUserDefaults]setBool:YES forKey:kIsLogin];
            [[NSUserDefaults standardUserDefaults]setValue:resp.name forKey:@"name"];
            [[NSUserDefaults standardUserDefaults]setValue:resp.iconurl forKey:@"iconurl"];
            RefreshUI([self.tableView reloadData])
        }else{
            [BaseTools showAlertWithTitle:@"登录失败" message:nil vc:self trueBlock:nil cancelBlock:nil];
        }
    }];
}
@end
