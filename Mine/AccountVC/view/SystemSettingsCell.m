//
//  SystemSettingsCell.m
//  Mine
//
//  Created by libin on 2017/12/11.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "SystemSettingsCell.h"

@implementation SystemSettingsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        _line = [[UILabel alloc]init];
        _line.backgroundColor = kBgColor;
        [self.contentView addSubview:_line];
        [_line makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.textLabel.left);
            make.right.equalTo(self.right);
            make.top.equalTo(self.contentView.bottom).offset(-1);
            make.height.equalTo(1);
        }];
    
        self.textLabel.textAlignment = NSTextAlignmentLeft;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

@end
