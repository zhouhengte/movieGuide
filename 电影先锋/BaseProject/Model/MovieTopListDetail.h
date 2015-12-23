//
//  MovieTopListDetail.h
//  BaseProject
//
//  Created by mis on 15/12/21.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "BaseModel.h"

@class /*Toplist,*/Nexttoplist,Previoustoplist,Movies;
@interface MovieTopListDetail : BaseModel


@property (nonatomic, strong) Previoustoplist *previousTopList;

//@property (nonatomic, strong) Toplist *topList;

@property (nonatomic, strong) Nexttoplist *nextTopList;

@property (nonatomic, strong) NSArray<Movies *> *movies;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, assign) NSInteger pageCount;


@end
//@interface Toplist : NSObject
//
//@property (nonatomic, assign) NSInteger ID;
//
//@property (nonatomic, copy) NSString *name;
//
//@property (nonatomic, copy) NSString *summary;
//
//@end





@interface Movies : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) CGFloat rating;

@property (nonatomic, copy) NSString *releaseLocation;

@property (nonatomic, copy) NSString *director;

@property (nonatomic, copy) NSString *actor2;

@property (nonatomic, assign) NSInteger rankNum;

@property (nonatomic, copy) NSString *posterUrl;

@property (nonatomic, copy) NSString *releaseDate;

@property (nonatomic, copy) NSString *actor;

@property (nonatomic, copy) NSString *movieType;

@property (nonatomic, copy) NSString *nameEn;

@property (nonatomic, copy) NSString *remark;

@property (nonatomic, assign) NSInteger decade;

@property (nonatomic, copy) NSString *name;

@end

