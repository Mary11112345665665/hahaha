//
//  JokeCell.m
//  YMHTitleAndFunny
//
//  Created by qianfeng007 on 15/12/7.
//  Copyright © 2015年 杨明辉. All rights reserved.
//

#import "JokeCell.h"
#import <UIImageView+WebCache.h>
//#import "UIView+Common.h"
#import "FrameModel.h"

@implementation JokeCell
{

    UILabel *_contentLabel;
    UIButton *_likesButton;
    UIButton *_commentsallButton;
    UIButton *_shareButton;
    

    UIImageView *_thumbnailImageView;
    

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
    
    _contentLabel = [UILabel new];
    _contentLabel.numberOfLines = 0;
    _contentLabel.font = CONTENTFONT;
    _commentsallButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_commentsallButton setBackgroundImage:[UIImage imageNamed:@"input_button_enable"] forState:UIControlStateNormal];
    [_commentsallButton setImage:[UIImage imageNamed:@"icon_for_comment"] forState:UIControlStateNormal];
    _shareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_shareButton setImage:[UIImage imageNamed:@"icon_tag"] forState:UIControlStateNormal];
    [_shareButton setBackgroundImage:[UIImage imageNamed:@"input_button_enable"] forState:UIControlStateNormal];
    _likesButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_likesButton setImage:[UIImage imageNamed:@"icon_for_good"] forState:UIControlStateNormal];
    [_likesButton setBackgroundImage:[UIImage imageNamed:@"input_button_enable"] forState:UIControlStateNormal];
    
    
    [self.contentView addSubview:_thumbnailImageView];
    [self.contentView addSubview:_commentsallButton];
    [self.contentView addSubview:_contentLabel];
    [self.contentView addSubview:_likesButton];
    [self.contentView addSubview:_shareButton];
    
}

////- (void)setModel:(BodyModel *)model{
//
//       [_thumbnailImageView sd_setImageWithURL:[NSURL URLWithString:[model.img[0] url] placeholderImage:[UIImage imageNamed:@"topic_Header"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//    }];
//    _likesButton.titleLabel.text = model.title;
//    _commentsallButton.titleLabel.text = model.commentsall;
//    _shareButton.titleLabel.text = model.shareUrl;
//    
//    _contentLabel.text = model.content;
//    
//    
//}

- (void)setCellFrame:(FrameModel *)cellFrame{
    _cellFrame = cellFrame;
    _thumbnailImageView.frame = cellFrame.thuViewFrame;
    _contentLabel.frame = cellFrame.contentFrame;
    _commentsallButton.frame = cellFrame.commentFrame;
    _shareButton.frame = cellFrame.sharesFrame;
    if (cellFrame.bodyModel.img.count != 0) {
        NSURL *url = [NSURL URLWithString:[cellFrame.bodyModel.img[0] imageUrl]];

       
        [_thumbnailImageView sd_setImageWithURL:url placeholderImage:nil];
    }
    _likesButton.titleLabel.text = cellFrame.bodyModel.title;
    _commentsallButton.titleLabel.text = cellFrame.bodyModel.commentsall;
    _shareButton.titleLabel.text = cellFrame.bodyModel.shareUrl;
    
    _contentLabel.text = cellFrame.bodyModel.content;

}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
