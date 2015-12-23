//
//  NewsCell1.h
//  BaseProject
//
//  Created by mis on 15/12/19.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell1 : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentCount;


@end
