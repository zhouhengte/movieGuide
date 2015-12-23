//
//  MovieTopListDetailCell.h
//  BaseProject
//
//  Created by mis on 15/12/21.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTopListDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *MovieNameCNLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieNameENLabel;
@property (weak, nonatomic) IBOutlet UILabel *director;
@property (weak, nonatomic) IBOutlet UILabel *actorLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDate;
@property (weak, nonatomic) IBOutlet UITextView *remarkTextView;


@end
