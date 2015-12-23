//
//  ActorTopListDetail.h
//  BaseProject
//
//  Created by mis on 15/12/21.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "BaseModel.h"

@class Toplist,Persons;
@interface ActorTopListDetail : BaseModel


@property (nonatomic, strong) Toplist *topList;

@property (nonatomic, strong) NSArray<Persons *> *persons;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, assign) NSInteger pageCount;


@end
@interface Toplist : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *summary;

@end

@interface Persons : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger rating;

@property (nonatomic, copy) NSString *nameCn;

@property (nonatomic, assign) NSInteger rankNum;

@property (nonatomic, copy) NSString *birthLocation;

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *posterUrl;

@property (nonatomic, assign) NSInteger birthYear;

@property (nonatomic, copy) NSString *birthDay;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSString *constellation;

@property (nonatomic, copy) NSString *nameEn;

@end

