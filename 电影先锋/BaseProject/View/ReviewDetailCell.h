//
//  ReviewDetailCell.h
//  BaseProject
//
//  Created by mis on 15/12/22.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;


@end
