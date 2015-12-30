//
//  PituresCell.m
//  YMHTitleAndFunny
//
//  Created by qianfeng007 on 15/12/9.
//  Copyright © 2015年 杨明辉. All rights reserved.
//

#import "PituresCell.h"

#import <UIImageView+WebCache.h>
@implementation PituresCell
{
    UIImageView *_imageView1;
    UIImageView *_imageView2;
    UIImageView *_imageView3;
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self customViews];
    }
    return self;
    
}

- (void)customViews{
    
    _imageView1 = [UIImageView new];
    _imageView2 = [UIImageView new];
    _imageView3 = [UIImageView new];
    [self.contentView addSubview:_imageView1];
    [self.contentView addSubview:_imageView2];
    [self.contentView addSubview:_imageView3];

}
- (void)setModel:(ItemModel *)model{
    _model = model;
    
    [_imageView1 sd_setImageWithURL:[NSURL URLWithString:model.style.images[0]] placeholderImage:[UIImage imageNamed:@"topic_Header"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    [_imageView2 sd_setImageWithURL:[NSURL URLWithString:model.style.images[1]] placeholderImage:[UIImage imageNamed:@"topic_Header"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    [_imageView3 sd_setImageWithURL:[NSURL URLWithString:model.style.images[2]] placeholderImage:[UIImage imageNamed:@"topic_Header"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    CGFloat padding = 10.0;
    CGFloat width =  ([[UIScreen mainScreen] bounds].size.width-4*padding)/3;
    
    _imageView1.frame = CGRectMake(padding, padding, width, 80);
    _imageView2.frame = CGRectMake(padding*2+width, padding, width  , 80);
    _imageView3.frame = CGRectMake(padding*3+2 * width, padding, width, 80);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
