//
//  MovieTopList.h
//  BaseProject
//
//  Created by mis on 15/12/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "BaseModel.h"

@class Toplists;
@interface MovieTopList : BaseModel


@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, strong) NSMutableArray<Toplists *> *topLists;

@property (nonatomic, assign) NSInteger pageCount;


@end
@interface Toplists : NSObject

@property (nonatomic, copy) NSString *topListNameEn;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *topListNameCn;

@property (nonatomic, copy) NSString *summary;

@end

