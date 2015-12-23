//
//  VideoModel.m
//  BaseProject
//
//  Created by mis on 15/12/17.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel
+(id)parse:(NSDictionary *)responseObj{
    id model = [self new];
    [responseObj enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //转化videoList对应的数组中的元素为videList类型对象
        if ([key isEqualToString:@"videoList"]) {
            NSMutableArray *videoList = [NSMutableArray new];
            for (NSDictionary *dic in obj) {
                [videoList addObject:[Videolist parse:dic]];
            }
            obj = [videoList copy];
        }
        if ([key isEqualToString:@"videoSidList"]) {
            NSMutableArray *videoList = [NSMutableArray new];
            for (NSDictionary *dic in obj) {
                [videoList addObject:[Videosidlist parse:dic]];
            }
            obj = [videoList copy];
        }
        
        [model setValue:obj forKey:key];
    }];
    return model;
}
//防止向不存在的key赋值 崩溃
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
//防止把nil赋值给key 崩溃
-(void)setNilValueForKey:(NSString *)key{}
@end

@implementation Videosidlist
+(id)parse:(NSDictionary *)responseObj{
    id obj = [self new];
    [obj setValuesForKeysWithDictionary:responseObj];
    return obj;
}
//防止向不存在的key赋值 崩溃
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
//防止把nil赋值给key 崩溃
-(void)setNilValueForKey:(NSString *)key{}
@end


@implementation Videolist
+(id)parse:(NSDictionary *)responseObj{
    id model = [self new];
    //[obj setValuesForKeysWithDictionary:responseObj];
    [responseObj enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([key isEqualToString:@"description"]) {
            key = @"desc";
        }
        [model setValue:obj forKey:key];
    }];
    return model;

    
}
//防止向不存在的key赋值 崩溃
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
//防止把nil赋值给key 崩溃
-(void)setNilValueForKey:(NSString *)key{}
@end


