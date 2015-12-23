//
//  MoiveReview.h
//  BaseProject
//
//  Created by mis on 15/12/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "BaseModel.h"




@class Relatedobj;
@interface MoiveReview : BaseModel


@property (nonatomic, copy) NSString *rating;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSString *userImage;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) Relatedobj *relatedObj;

@end

@interface Relatedobj : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *rating;

@end

