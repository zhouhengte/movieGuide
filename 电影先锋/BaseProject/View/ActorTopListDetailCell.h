//
//  ActorTopListDetailCell.h
//  BaseProject
//
//  Created by mis on 15/12/21.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActorTopListDetailCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameENLabel;
@property (weak, nonatomic) IBOutlet UITextView *summaryTextView;

@end
