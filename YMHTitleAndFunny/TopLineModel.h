//
//  TopLineModel.h
//  YMHTitleAndFunny
//
//  Created by qianfeng007 on 15/12/7.
//  Copyright © 2015年 杨明辉. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol  StyleModel
@end
@interface StyleModel : JSONModel
@property (nonatomic, copy) NSString *type;
@property (nonatomic, strong) NSMutableArray *images;
@end


@interface LinkModel : JSONModel
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *url;

@end



@protocol ItemModel
@end
@interface ItemModel : JSONModel
@property (nonatomic, copy) NSString<Optional> *thumbnail;
@property (nonatomic, copy) NSString<Optional> *online;
@property (nonatomic, copy) NSString<Optional> *title;
@property (nonatomic, copy) NSString<Optional> *source;//

@property (nonatomic, copy) NSString<Optional> *updateTime;//
@property (nonatomic, copy) NSString<Optional> *itemID;//
@property (nonatomic, copy) NSString<Optional> *documentId;
@property (nonatomic, copy) NSString<Optional> *type;
@property (nonatomic, copy) NSString<Optional> *hasSlide;

@property (nonatomic, copy) NSString<Optional> *commentsUrl;//
@property (nonatomic, copy) NSString<Optional> *comments;//
@property (nonatomic, copy) NSString<Optional> *commentsall;//
@property (nonatomic, copy) StyleModel<Optional> *style;//存放类型和三张图片
@property (nonatomic, copy)LinkModel *link;





@end


@interface TopLineModel : JSONModel
//第一个最外部的
@property (nonatomic, copy)NSString *listId;
@property (nonatomic, copy)NSString *type;
@property (nonatomic, copy)NSString *expiredTime;
@property (nonatomic, copy)NSString *currentPage;
@property (nonatomic, copy)NSString *totalPage;
@property (nonatomic, copy) NSMutableArray<ItemModel> *item;

@end
