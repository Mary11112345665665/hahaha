//
//  TopLineModel1.h
//  YMHTitleAndFunny
//
//  Created by qianfeng007 on 15/12/7.
//  Copyright © 2015年 杨明辉. All rights reserved.
//

#import <JSONModel/JSONModel.h>



@interface LinkModel1 : JSONModel
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *url;

@end



@protocol ItemModel1
@end
@interface ItemModel1 : JSONModel
@property (nonatomic, copy) NSString *thumbnail;
@property (nonatomic, copy) NSString<Optional> *online;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *updateTime;//
@property (nonatomic, copy) NSString *itemID;
@property (nonatomic, copy) NSString *documentId;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *hasSlide;
@property (nonatomic, copy) NSString *commentsUrl;
@property (nonatomic, copy) NSString *comments;
@property (nonatomic, copy) NSString *commentsall;
@property (nonatomic, copy)LinkModel1 *link;


@end

@interface TopLineModel1 : JSONModel
@property (nonatomic, copy) NSString *listId;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *expiredTime;
@property (nonatomic, copy) NSString *currentPage;
@property (nonatomic, copy) NSString *totalPage;
@property (nonatomic, copy)NSMutableArray <ItemModel1> *item;

@end
