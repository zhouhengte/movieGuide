//
//  MovieNews.h
//  BaseProject
//
//  Created by mis on 15/12/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "BaseModel.h"


@class Newslist,Images;
@interface MovieNews : BaseModel



@property (nonatomic, strong) NSMutableArray<Newslist *> *newsList;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, assign) NSInteger pageCount;


@end

@interface Newslist : NSObject

@property (nonatomic, copy) NSString *title2;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, assign) NSInteger publishTime;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, strong) NSArray<Images *> *images;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *summaryInfo;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger commentCount;

@end

@interface Images : NSObject

@property (nonatomic, copy) NSString *url2;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url1;

@property (nonatomic, assign) NSInteger gId;

@property (nonatomic, copy) NSString *desc;

@end

