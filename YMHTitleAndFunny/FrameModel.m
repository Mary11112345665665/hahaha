//
//  FrameModel.m
//  YMHTitleAndFunny
//
//  Created by qianfeng007 on 15/12/10.
//  Copyright © 2015年 杨明辉. All rights reserved.
//

#import "FrameModel.h"
#import "UIView+Common.h"
@implementation FrameModel

- (void)setBodyModel:(BodyModel *)bodyModel
{
    _bodyModel = bodyModel;
    CGFloat leftPadding = 20.0;
    CGFloat rightPadding = 20.0;
    CGFloat topPadding = 10.0;
    CGFloat padding = 10.0;
    
    CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    if (bodyModel.content) {
        
       
        CGFloat contentHeight = [self sizeWithText:bodyModel.content maxSize:CGSizeMake(width-leftPadding-rightPadding, MAXFLOAT) fontSize:CONTENTFONT].height;
        _contentFrame = CGRectMake(leftPadding, topPadding, width - 2 * leftPadding, contentHeight);
        if (bodyModel.img.count > 0) {
            _thuViewFrame = CGRectMake(leftPadding, CGRectGetMaxY(_contentFrame) + padding, width - 2 * leftPadding, width - 2 * leftPadding);
            _likesFrame = CGRectMake(leftPadding, CGRectGetMaxY(_thuViewFrame) + padding, 60, 20);
            _commentFrame = CGRectMake(leftPadding + CGRectGetMaxX(_likesFrame)+2*padding, CGRectGetMaxY(_thuViewFrame) + padding, 60, 20);
            _sharesFrame = CGRectMake(leftPadding + CGRectGetMaxX(_commentFrame)+2*padding, CGRectGetMaxY(_thuViewFrame) + padding, 60, 20);
        } else {
            _thuViewFrame = CGRectZero;
            _likesFrame = CGRectMake(leftPadding, CGRectGetMaxY(_contentFrame), 60, 20);
            _commentFrame = CGRectMake(leftPadding + CGRectGetMaxX(_likesFrame)+2*padding, CGRectGetMaxY(_contentFrame) + padding, 60, 20);
            _sharesFrame = CGRectMake(leftPadding + CGRectGetMaxX(_commentFrame)+2*padding, CGRectGetMaxY(_contentFrame) + padding, 60, 20);
        }
    } else {
        _contentFrame = CGRectZero;
        if (bodyModel.img.count > 0) {
            _thuViewFrame = CGRectMake(leftPadding, topPadding + padding, width - 2 * leftPadding, width - 2 * leftPadding);
            _likesFrame = CGRectMake(leftPadding, CGRectGetMaxY(_thuViewFrame) + padding, 60, 20);
            _commentFrame = CGRectMake(leftPadding + CGRectGetMaxX(_likesFrame)+2*padding, CGRectGetMaxY(_thuViewFrame) + padding, 60, 20);
            _sharesFrame = CGRectMake(leftPadding + CGRectGetMaxX(_commentFrame)+2*padding, CGRectGetMaxY(_thuViewFrame) + padding, 60, 20);
        } else {
            _thuViewFrame = CGRectZero;
            _likesFrame = CGRectMake(leftPadding, topPadding,60, 20);
            _commentFrame = CGRectMake(leftPadding + CGRectGetMaxX(_likesFrame)+2*padding, topPadding, 60, 20);
            _sharesFrame = CGRectMake(leftPadding + CGRectGetMaxX(_commentFrame)+2*padding, topPadding, 60, 20);
        }
    }
    
    
    
    _cellHeight = CGRectGetMaxY(_sharesFrame) + padding;
}
//计算文字高度
- (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(UIFont *)font{
    
    // 边界随着size 变化
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

    
    

@end
