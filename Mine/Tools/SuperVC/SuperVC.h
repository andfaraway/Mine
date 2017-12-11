//
//  SuperVC.h
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

/// 继承 UIViewController 添加一些方法 以快速调用 

#import <UIKit/UIKit.h>

@interface SuperVC : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

- (void)initTableView;

@end
