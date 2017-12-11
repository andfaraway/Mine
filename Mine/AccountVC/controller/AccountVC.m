//
//  AccountVC.m
//  Mine
//
//  Created by libin on 2017/12/8.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "AccountVC.h"

@interface AccountVC ()

@end

@implementation AccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账号";
    [self initTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
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




@end
