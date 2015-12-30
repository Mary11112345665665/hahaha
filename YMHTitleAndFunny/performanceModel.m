//
//  performanceModel.m
//  YMHTitleAndFunny
//
//  Created by qianfeng007 on 15/12/10.
//  Copyright © 2015年 杨明辉. All rights reserved.
//

#import "performanceModel.h"

@implementation SizeModel

@end

@implementation ImgModel
+(JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"size":@"imageSize", @"url" : @"imageUrl"}];
}
@end

@implementation PerformanceLinkModel

@end

@implementation MetaModel

@end

@implementation BodyModel

@end


@implementation performanceModel

@end
