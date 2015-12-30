//
//  JokeCell.h
//  YMHTitleAndFunny
//
//  Created by qianfeng007 on 15/12/7.
//  Copyright © 2015年 杨明辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "performanceModel.h"
@class FrameModel;
@interface JokeCell : UITableViewCell
@property (nonatomic, copy) BodyModel *model;
@property (nonatomic, strong) FrameModel *cellFrame;
@end
