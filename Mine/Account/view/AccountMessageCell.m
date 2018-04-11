//
//  AccountMessageCell.m
//  Mine
//
//  Created by libin on 2017/12/8.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "AccountMessageCell.h"
@interface AccountMessageCell()
@property(nonatomic,strong)UIImageView *headImageView;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UIImageView *lvImageView;
@property(nonatomic,strong)UIImageView *qiandaoImageView;
@end;
@implementation AccountMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = NO;
        _headImageView = [[UIImageView alloc]init];
        _headImageView.backgroundColor = kLightGrayColor;
        _headImageView.layer.cornerRadius = 30*kScaleWidth;
        _headImageView.clipsToBounds = YES;
        _headImageView.contentMode = UIViewContentModeScaleAspectFit;
        _headImageView.image = [UIImage imageNamed:@"testHeadImage"];
        [self.contentView addSubview:_headImageView];
        [_headImageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.top).offset(16*kScaleWidth);
            make.left.equalTo(self.contentView.left).offset(15*kScaleWidth);
            make.width.equalTo(60*kScaleWidth);
            make.height.equalTo(60*kScaleWidth);
        }];
        
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textColor = [UIColor colorWithHexString:@"#323233"];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = [UIFont systemFontOfSize:17*kScaleWidth];
        _nameLabel.text = @"Being41";
        [self.contentView addSubview:_nameLabel];
        [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImageView.right).offset(10*kScaleWidth);
            make.top.equalTo(self.contentView.top).offset(30*kScaleWidth);
        }];
        
        _lvImageView = [[UIImageView alloc]init];
        _lvImageView.backgroundColor = kLightGrayColor;
//        _lvImageView.layer.cornerRadius = 8;
//        _lvImageView.clipsToBounds = YES;
        UIImage *lvImage = [UIImage imageNamed:@"Lv"];
        _lvImageView.image = lvImage;
        [self.contentView addSubview:_lvImageView];
        [_lvImageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel.bottom).offset(7*kScaleWidth);
            make.left.equalTo(self.nameLabel.left);
            make.width.equalTo(32*kScaleWidth);
            make.height.equalTo(16*kScaleWidth);
        }];
        
        _qiandaoImageView = [[UIImageView alloc]init];
        _qiandaoImageView.backgroundColor = kLightGrayColor;
        _qiandaoImageView.image = [UIImage imageNamed:@"qiandao"];
        [self.contentView addSubview:_qiandaoImageView];
        [_qiandaoImageView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.headImageView.centerY);
            make.right.equalTo(self.contentView.right).offset(-11*kScaleWidth);
            make.width.equalTo(65*kScaleWidth);
            make.height.equalTo(28*kScaleWidth);
        }];
       
        UIView *line = [UIView new];
        line.backgroundColor = kBgColor;
        [self.contentView addSubview: line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.top).offset(94*kScaleWidth);
            make.width.equalTo(self.contentView.width);
            make.height.equalTo(1);
            make.left.equalTo(self.contentView.left);
        }];
        
        NSArray *titleArr = @[@"动态",@"关注",@"粉丝",@"我的资料"];
        for (int i=0; i<4; i++) {
            UIView *bgView = [UIView new];
            bgView.backgroundColor = kWhiteColor;
            [self.contentView addSubview:bgView];
            [bgView makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.left).offset(i*kWidth/4);
                make.top.equalTo(line.bottom);
                make.width.equalTo(self.contentView.width).multipliedBy(0.25);
                make.height.equalTo(52*kScaleWidth);
            }];
            
            //标题
            UILabel *titleLabel = [UILabel new];
            titleLabel.textColor = [UIColor colorWithHexString:@"#979798"];
            titleLabel.font = [UIFont systemFontOfSize:12*kScaleWidth];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            [bgView addSubview:titleLabel];
            [titleLabel makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(bgView.width);
                make.centerX.equalTo(bgView.centerX);
                make.top.equalTo(bgView.top).equalTo(12*kScaleWidth);
                make.height.equalTo(12*kScaleWidth);
            }];
            titleLabel.text = titleArr[i];
            if (i != 3) {
                UILabel *numLabel = [[UILabel alloc]init];
                numLabel.textColor = [UIColor colorWithHexString:@"#323232"];
                numLabel.font = [UIFont boldSystemFontOfSize:14*kScaleWidth];
                numLabel.textAlignment = NSTextAlignmentCenter;
                numLabel.text = @"0";
                numLabel.tag = 400 + i;
                [bgView addSubview:numLabel];
                [numLabel makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(titleLabel.bottom).offset(3*kScaleWidth);
                    make.width.equalTo(bgView.width);
                    make.centerX.equalTo(bgView.centerX);
                }];
                
                //竖直分割线
                UIView *vLine = [UIView new];
                vLine.backgroundColor = [UIColor colorWithHexString:@"#eeeff0"];
                [bgView addSubview:vLine];
                [vLine makeConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(1);
                    make.height.equalTo(29*kScaleWidth);
                    make.right.equalTo(bgView.right);
                    make.centerY.equalTo(bgView.centerY);
                }];

            }else{
                [titleLabel updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(bgView.top).equalTo(30*kScaleWidth);
                }];
                
                UIImage *image = [UIImage imageNamed:@"info_edit"];
                UIImageView *editImageView = [[UIImageView alloc]initWithImage:image];
                [bgView addSubview:editImageView];
                [editImageView makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(titleLabel.top).offset(-5*kScaleWidth);
                    make.centerX.equalTo(bgView.centerX);
                    make.width.equalTo(image.size.width);
                    make.height.equalTo(image.size.height);
                }];
            }
        }
    }
    return self;
}

- (void)setModel:(AccountModel *)model{
    _model = model;
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:model.iconurl] placeholderImage:[UIImage imageNamed:kPlaceholder_Account]];
    _nameLabel.text = model.name;
}

@end
