//
//  performanceModel.h
//  YMHTitleAndFunny
//
//  Created by qianfeng007 on 15/12/10.
//  Copyright © 2015年 杨明辉. All rights reserved.
//

#import <JSONModel/JSONModel.h>


//空协议只用与数组
@interface SizeModel : JSONModel
@property (nonatomic, copy) NSString *width;
@property (nonatomic, copy) NSString *height;
@end

@protocol ImgModel
@end

@interface ImgModel : JSONModel
@property (nonatomic, copy) NSString<Optional> *imageUrl;
@property (nonatomic, copy) SizeModel<Optional> *imageSize;
@end


@interface PerformanceLinkModel : JSONModel
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *url;
@end

@protocol BodyModel
@end

@interface BodyModel : JSONModel
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString<Optional> *title;
@property (nonatomic, copy) NSString *shareTitle;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, copy) NSString *thumbnail;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *shareUrl;
@property (nonatomic, copy) NSString *commentsUrl;
@property (nonatomic, copy) NSString *ctime;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *commentsall;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, copy) NSString<Optional> *staticImg;
@property (nonatomic, copy) PerformanceLinkModel *link;
@property (nonatomic, copy) NSMutableArray<ImgModel> *img;

@end

@interface MetaModel : JSONModel
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *expiredTime;
@property (nonatomic, copy) NSString *pageSize;
@end



@interface performanceModel : JSONModel
@property (nonatomic, strong) MetaModel<Optional> *meta;//千万不能写错，如果改了，要在.m文件里对应


// 只有数组才要用空协议，要NSMutableArray<BodyModel>，其它不是数组的model不需要空协议PerformanceLinkModel *link;
@property (nonatomic, strong) NSMutableArray<BodyModel> *body;

@end
