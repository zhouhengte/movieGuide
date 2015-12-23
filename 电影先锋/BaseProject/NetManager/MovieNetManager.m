//
//  MovieNetManager.m
//  BaseProject
//
//  Created by mis on 15/12/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "MovieNetManager.h"
#import "MoviePath.h"
#import "MovieNewsDetail.h"
#import "MovieTrailer.h"
#import "MovieTopList.h"
#import "ActorTopListDetail.h"
#import "MovieTopListDetail.h"
#import "MoiveReview.h"
#import "MovieReviewDetail.h"

@implementation MovieNetManager

+(id)getNewsWithStartIndex:(NSInteger)startIndex completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path=[NSString stringWithFormat:kNewsPath, startIndex];
    return [self GET:path parameters:nil completionHandle:^(id model, NSError *error) {
        completionHandle([MovieNews parse:model], error);
    }];
}

+(id)getNewsDetailWithURL:(NSString *)URLStr completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:URLStr parameters:nil completionHandle:^(id model, NSError *error) {
        completionHandle([MovieNewsDetail parse:model],error);
    }];
}

+(id)getMovieTrailerWithURL:(NSString *)URLStr completionHandle:(void (^)(id, NSError *))completionHandle{
    return [self GET:URLStr parameters:nil completionHandle:^(id model, NSError *error) {
        completionHandle([MovieTrailer parse:model],error);
    }];
}

+(id)getTopListWithStartIndex:(NSInteger)startIndex completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path=[NSString stringWithFormat:kTopListPath, startIndex];
    return [self GET:path parameters:nil completionHandle:^(id model, NSError *error) {
        completionHandle([MovieTopList parse:model], error);
    }];
}

+(id)getTopListDetailWithStartIndex:(NSInteger)startIndex ID:(NSInteger)ID Style:(NSInteger)style completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:kTopListDetailPath,startIndex,ID];
    if (style == 2) {
        return [self GET:path parameters:nil completionHandle:^(id model, NSError *error) {
            completionHandle([ActorTopListDetail parse:model],error);
        }];
    }
    return [self GET:path parameters:nil completionHandle:^(id model, NSError *error) {
        completionHandle([MovieTopListDetail parse:model],error);
    }];
}

+(id)getReviewWithCompletionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:kReviewPath];
    return [self GET:path parameters:nil completionHandle:^(id model, NSError *error) {
        completionHandle([MoiveReview parse:model],error);
    }];
}

+(id)getReviewDetailWithID:(NSInteger)ID completionHandle:(void (^)(id, NSError *))completionHandle{
    NSString *path = [NSString stringWithFormat:kReviewDetailPath,ID];
    return [self GET:path parameters:nil completionHandle:^(id model, NSError *error) {
        completionHandle([MovieReviewDetail parse:model],error);
    }];
}


@end
