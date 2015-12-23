//
//  MovieTrailerCell.h
//  BaseProject
//
//  Created by mis on 15/12/21.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTrailerCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

@end
