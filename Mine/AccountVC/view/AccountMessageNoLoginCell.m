//
//  AccountMessageNoLoginCell.m
//  Mine
//
//  Created by libin on 2017/12/11.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "AccountMessageNoLoginCell.h"

@implementation AccountMessageNoLoginCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel *label1 = [[UILabel alloc]init];
        label1.textColor = kTextColor;
        label1.textAlignment = NSTextAlignmentCenter;
        label1.font = [UIFont systemFontOfSize:16*kScaleWidth];
        [self.contentView addSubview:label1];
        [label1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.top).offset(19*kScaleWidth);
            make.centerX.equalTo(self.contentView.centerX);
            make.width.equalTo(self.contentView.width);
            make.height.equalTo(16*kScaleWidth);
        }];
        label1.text = @"登录网易云音乐";
        
        UILabel *label2 = [[UILabel alloc]init];
        label2.textColor = kTextColor;
        label2.textAlignment = NSTextAlignmentCenter;
        label2.font = [UIFont systemFontOfSize:16*kScaleWidth];
        [self.contentView addSubview:label2];
        [label2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label1.bottom).offset(10*kScaleWidth);
            make.centerX.equalTo(self.contentView.centerX);
            make.width.equalTo(self.contentView.width);
            make.height.equalTo(16*kScaleWidth);
        }];
        label2.text = @"手机电脑多段同步，320k高音质无限下载";
        
        UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [loginBtn setTitle:@"立即登录" forState:UIControlStateNormal];
        [loginBtn setTitleColor:kTextColor forState:UIControlStateNormal];
        loginBtn.titleLabel.font = [UIFont systemFontOfSize:16*kScaleWidth];
        loginBtn.layer.cornerRadius = 5;
        loginBtn.layer.borderWidth = 1;
        loginBtn.layer.borderColor = kLineColor.CGColor;
        [self.contentView addSubview:loginBtn];
        [loginBtn makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label2.bottom).offset(16*kScaleWidth);
            make.width.equalTo(300*kScaleWidth);
            make.height.equalTo(40*kScaleWidth);
            make.centerX.equalTo(self.contentView.centerX);
        }];
        [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)login{
    if (self.loginBlock) {
        self.loginBlock();
    }
}

@end
