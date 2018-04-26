//
//  FriendsVC.m
//  Mine
//
//  Created by libin on 2018/4/11.
//  Copyright © 2018年 Cnmobi. All rights reserved.
//

#import "FriendsVC.h"

@interface FriendsVC ()

@end

@implementation FriendsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
}

- (void)setNav{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_friendAdd"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnClick)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"icon_musicPlay"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick)];
    
    UISegmentedControl *segmented = [[UISegmentedControl alloc]initWithItems:@[@"动态",@"附近"]];
//    self.navigationItem.titleView = segmented;
    
    [self setTitleView];
    
    [self releaseVideo];
    
}

- (void)leftBtnClick{
    
}

- (void)rightBtnClick{
    
}


- (void)setTitleView{
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, 150, 30);
    
    UIColor *bgColor = RGBColor(180, 182, 189);
    UIButton *dynamicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dynamicBtn.backgroundColor = bgColor;
    dynamicBtn.layer.borderColor =  bgColor.CGColor;
    dynamicBtn.layer.borderWidth = 1;
    dynamicBtn.layer.cornerRadius = 15;
    [dynamicBtn setTitle:@"动态" forState:UIControlStateNormal];
    [dynamicBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    dynamicBtn.frame = CGRectMake(0, 0, 80, 30);
    [view addSubview:dynamicBtn];
    
    UIButton *nearbyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nearbyBtn.backgroundColor = [UIColor whiteColor];
    nearbyBtn.layer.borderColor =  bgColor.CGColor;
    nearbyBtn.layer.borderWidth = 1;
    nearbyBtn.layer.cornerRadius = 15;
    [nearbyBtn setTitle:@"附近" forState:UIControlStateNormal];
    [nearbyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    nearbyBtn.frame = CGRectMake(60, 0, 80, 30);
    [view addSubview:nearbyBtn];
    
    [view bringSubviewToFront:dynamicBtn];
    self.navigationItem.titleView = view;
}

- (void)releaseVideo{
    UIView *whiteView = [UIView new];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.frame = CGRectMake(0, 0, kWidth, 40);
    [self.view addSubview:whiteView];
    
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_write"]];
    [whiteView addSubview:imageView1];
    [imageView1 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(whiteView.left).offset(43);
        make.centerY.equalTo(whiteView.centerY);
        make.width.height.equalTo(23);
    }];
    
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"发动态";
    [whiteView addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView1.right).offset(10);
        make.centerY.equalTo(whiteView.centerY);
    }];
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithHexString:@"e2e3e4"];
    [whiteView addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(whiteView.top).equalTo(6);
        make.width.equalTo(1);
        make.bottom.equalTo(whiteView.bottom).equalTo(-6);
        make.centerX.equalTo(whiteView.centerX);
    }];
    
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_video"]];
    [whiteView addSubview:imageView2];
    [imageView2 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(line.left).offset(30);
        make.centerY.equalTo(whiteView.centerY);
        make.width.equalTo(35);
        make.height.equalTo(23);
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"发视频";
    [whiteView addSubview:label2];
    [label2 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView2.right).offset(10);
        make.centerY.equalTo(whiteView.centerY);
    }];
    
}


//显示nav下面黑线
- (void)useMethodToFindBlackLineAndHidden{
}
@end
