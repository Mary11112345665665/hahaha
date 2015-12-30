//
//  TopLineCell.m
//  YMHTitleAndFunny
//
//  Created by qianfeng007 on 15/12/7.
//  Copyright © 2015年 杨明辉. All rights reserved.
//

#import "TopLineCell.h"
#import "TopLineModel.h"
#import "TopLineModel1.h"
#import "UIView+Common.h"
#import <UIImageView+WebCache.h>
#import "unity.pch"



@implementation TopLineCell{
    
     UILabel *_titleLabel;
    
    
    UIImageView *_thumbnailImageView;
    UILabel *_commentsallLabel;
    UILabel *_updateTimeLabel;
    UIImageView *_imageView;
    
    
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self= [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
       [self customViews];
    }
    return self;
}

- (void)customViews{
    
    _thumbnailImageView = [UIImageView new];
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.numberOfLines = 0;
    _titleLabel.textColor = [UIColor blueColor];
    _updateTimeLabel = [UILabel new];
    _updateTimeLabel.font = [UIFont systemFontOfSize:15];
    _commentsallLabel = [UILabel new];
    _commentsallLabel.font = [UIFont systemFontOfSize:15];
    
   _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_for_comment"]];

    [self.contentView addSubview:_imageView];
    [self.contentView addSubview:_thumbnailImageView];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_updateTimeLabel];
    [self.contentView addSubview:_commentsallLabel];
    
}

- (void)setModel:(ItemModel *)model{
    
    _model = model;
    [_thumbnailImageView sd_setImageWithURL:[NSURL URLWithString:model.thumbnail] placeholderImage:[UIImage imageNamed:@"topic_Header"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    _titleLabel.text = model.title;

    _commentsallLabel.text = model.commentsall;
    
    NSArray *strings = [model.updateTime componentsSeparatedByString:@" "];
    if (strings.count == 2) {
        //只要小时制时间
        _updateTimeLabel.text = [NSString stringWithFormat:@"%@",strings[1]];
    }
    
}

- (void)layoutSubviews{
    
    
    [super layoutSubviews];
    CGFloat leftPadding = 10;
    CGFloat topPadding = 10;
    CGFloat padding = 20.0;
    _thumbnailImageView.frame = CGRectMake(leftPadding, topPadding, 80, 80);
    _titleLabel.frame = CGRectMake(maxX(_thumbnailImageView)+padding, topPadding, width(self.contentView) - maxX(_thumbnailImageView) - 2*padding, 50);
    _updateTimeLabel.frame = CGRectMake(maxX(_thumbnailImageView)+padding, maxY(_titleLabel)+padding, 70, 20);
    _commentsallLabel.frame = CGRectMake(maxX(_updateTimeLabel)+padding*3, maxY(_titleLabel)+padding, 40, 20);
    _imageView.frame = CGRectMake(maxX(_commentsallLabel), maxY(_titleLabel)+padding, 20, 20);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
