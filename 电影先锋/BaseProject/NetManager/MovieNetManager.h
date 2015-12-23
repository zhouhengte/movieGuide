//
//  MovieNetManager.h
//  BaseProject
//
//  Created by mis on 15/12/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "MovieNews.h"

@interface MovieNetManager : BaseNetManager

+ (id)getNewsWithStartIndex:(NSInteger)startIndex kCompletionHandle

+ (id)getNewsDetailWithURL:(NSString *)URLStr kCompletionHandle

+ (id)getMovieTrailerWithURL:(NSString *)URLStr kCompletionHandle

+ (id)getTopListWithStartIndex:(NSInteger)startIndex kCompletionHandle

+ (id)getTopListDetailWithStartIndex:(NSInteger)startIndex ID:(NSInteger)ID Style:(NSInteger)style kCompletionHandle

+ (id)getReviewWithCompletionHandle:(void(^)(id model,NSError *error))completionHandle;

+ (id)getReviewDetailWithID:(NSInteger)ID kCompletionHandle

@end
