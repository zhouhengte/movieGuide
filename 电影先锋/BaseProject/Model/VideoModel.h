//
//  VideoModel.h
//  BaseProject
//
//  Created by mis on 15/12/17.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "BaseModel.h"

@class Videosidlist,Videolist;
@interface VideoModel : BaseModel


@property (nonatomic, copy) NSString *videoHomeSid;

@property (nonatomic, strong) NSArray<Videosidlist *> *videoSidList;

@property (nonatomic, strong) NSArray<Videolist *> *videoList;
+(id)parse:(NSDictionary *)responseObj;

@end


@interface Videosidlist : NSObject

@property (nonatomic, copy) NSString *sid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *imgsrc;
//把传入的字典转换为 Videosidlist类型对象
+(id)parse:(NSDictionary *)responseObj;


@end

@interface Videolist : NSObject
//description ->desc
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *replyid;

@property (nonatomic, copy) NSString *mp4_url;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, assign) NSInteger length;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *m3u8Hd_url;

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *videosource;

@property (nonatomic, copy) NSString *mp4Hd_url;

@property (nonatomic, assign) NSInteger playersize;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *m3u8_url;
+(id)parse:(NSDictionary *)responseObj;

@end

