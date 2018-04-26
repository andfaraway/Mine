//
//  MyMusicVC.m
//  Mine
//
//  Created by libin on 2018/1/11.
//  Copyright © 2018年 Cnmobi. All rights reserved.
//

#import "MyMusicVC.h"
#import "MyMusicModel.h"
#import "SystemSettingsCell.h"

@interface MyMusicVC ()
{
    NSArray *titleArr;
    NSArray *imageArr;
    NSArray *musicCountArr;
}

@end

static  NSString *titleCell = @"titleCell";
@implementation MyMusicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的音乐";
    [self getInfo];
    [self initTableView];
}

- (void)getInfo{
    titleArr = @[@"本地音乐",@"最近播放",@"我的电台",@"我的收藏"];
    imageArr = @[@"music_red",@"play_red",@"menu_red",@"star_red"];
    musicCountArr = @[@55,@100,@6,@7];
}

- (void)initTableView{
    [super initTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kCELL_H;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 30;
    return kCELL_H;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SystemSettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:titleCell];
        if (!cell) {
            cell = [[SystemSettingsCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:titleCell];
        }
        cell.imageView.image = [UIImage imageNamed:imageArr[indexPath.row]];
        cell.textLabel.text = titleArr[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", musicCountArr[indexPath.row]];
        cell.line.hidden = NO;
        if (indexPath.row == 3) {
            cell.line.hidden = YES;
        }
        return cell;
    }else{
      
    }
    UITableViewCell *cell = [UITableViewCell new];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = kBgColor;
    view.frame = CGRectMake(0, 0, kWidth, 30);
    
    UILabel *label = [[UILabel alloc]init];
    label.textAlignment = NSTextAlignmentLeft;
    label.text = @"    >  我创建的歌单（6）";
    label.textColor = RGBColor(100, 100, 100);
    label.font = [UIFont systemFontOfSize:15];
    [view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.top);
        make.left.equalTo(view.left);
        make.bottom.equalTo(view.bottom);
    }];
    
    return view;
}

//显示nav下面黑线
- (void)useMethodToFindBlackLineAndHidden{
}

@end
