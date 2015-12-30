//
//  FrameModel.h
//  YMHTitleAndFunny
//
//  Created by qianfeng007 on 15/12/10.
//  Copyright © 2015年 杨明辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "performanceModel.h"
#import <UIKit/UIKit.h>
#define CONTENTFONT [UIFont systemFontOfSize:24]
@interface FrameModel : NSObject

//<UIKit/UIKit.h>才能用CGRect
@property (nonatomic, assign, readonly) CGRect thuViewFrame;
@property (nonatomic, assign, readonly) CGRect likesFrame;
@property (nonatomic, assign, readonly) CGRect sharesFrame;
@property (nonatomic, assign, readonly) CGRect commentFrame;
@property (nonatomic, assign, readonly) CGRect contentFrame;

@property (nonatomic, assign,readonly)CGFloat cellHeight;


@property (nonatomic, strong) BodyModel *bodyModel;
@end
