//
//  MovieTrailer.h
//  BaseProject
//
//  Created by mis on 15/12/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "BaseModel.h"

@class Trailers;
@interface MovieTrailer : BaseModel


@property (nonatomic, strong) NSArray<Trailers *> *trailers;


@end
@interface Trailers : NSObject

@property (nonatomic, assign) NSInteger rating;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *coverImg;

@property (nonatomic, assign) NSInteger movieId;

@property (nonatomic, assign) NSInteger videoLength;

@property (nonatomic, copy) NSString *videoTitle;

@property (nonatomic, copy) NSString *movieName;

@property (nonatomic, strong) NSArray<NSString *> *type;

@property (nonatomic, copy) NSString *hightUrl;

@end

