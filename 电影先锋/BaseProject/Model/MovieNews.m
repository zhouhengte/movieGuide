//
//  MovieNews.m
//  BaseProject
//
//  Created by mis on 15/12/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "MovieNews.h"

@implementation MovieNews




+ (NSDictionary *)objectClassInArray{
    return @{@"newsList" : [Newslist class]};
}


@end


@implementation Newslist

+ (NSDictionary *)objectClassInArray{
    return @{@"images" : [Images class]};
}

@end


@implementation Images

@end



