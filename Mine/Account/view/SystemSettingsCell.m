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
        self.textLabel.textAlignment = NSTextAlignmentLeft;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        _line = [[UILabel alloc]init];
        _line.backgroundColor = kBgColor;
        [self.contentView addSubview:_line];
        [_line makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.textLabel.left);
            make.right.equalTo(self.right);
            make.top.equalTo(self.contentView.bottom).offset(-1);
            make.height.equalTo(1);
        }];
    
        self.rightLabel = [[UILabel alloc]init];
        self.rightLabel.backgroundColor = kWarmingRedColor;
        self.rightLabel.layer.cornerRadius = kCELL_H/6.0;
        self.rightLabel.textColor = kWhiteColor;
        self.rightLabel.clipsToBounds = YES;
        self.rightLabel.font = [UIFont systemFontOfSize:10*kScaleWidth];
        [self.contentView addSubview:self.rightLabel];
        [self.rightLabel makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(kCELL_H/3.0);
            make.centerY.equalTo(self.contentView.centerY);
            make.right.equalTo(self.contentView.right);
        }];
        self.rightLabel.hidden = YES;
    }
    return self;
}

- (void)setSwithState:(bool)swithState{
    _swithState = swithState;
    UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
    self.accessoryView = switchview;
    switchview.selected = swithState;
}


@end
