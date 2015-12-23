//
//  MovieReviewViewController.m
//  BaseProject
//
//  Created by mis on 15/12/22.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "MovieReviewViewController.h"
#import "MovieNetManager.h"
#import "MoiveReview.h"
#import "ReviewDetailCell.h"
#import "ReviewDetailViewController.h"

@interface MovieReviewViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *movieReviewArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MovieReviewViewController

-(void)viewDidLoad{
    [MovieNetManager getReviewWithCompletionHandle:^(id model, NSError *error) {
        if (!error) {
            self.movieReviewArray = model;
            [self.tableView reloadData];
        }else{
            NSLog(@"获取Review失败:%@",error);
        }
    }];
    
    //顶部刷新
    __weak UITableView *tb = _tableView;
    [_tableView addHeaderRefresh:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
#warning 顶部刷新还未验证
            [MovieNetManager getReviewWithCompletionHandle:^(id model, NSError *error) {
                if (!error) {
                    self.movieReviewArray = model;
                    [self.tableView reloadData];
                }else{
                    NSLog(@"获取error:%@",error);
                }
            }];
            dispatch_async(dispatch_get_main_queue(), ^{
                [tb endHeaderRefresh];
            });
        });
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.movieReviewArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ReviewDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReviewDetailCell"];
    MoiveReview *movieReview = self.movieReviewArray[indexPath.row];
    cell.titleLabel.text = movieReview.title;
    cell.summaryLabel.text = movieReview.summary;
    cell.nickNameLabel.text = [NSString stringWithFormat:@"%@ 评 《%@》",movieReview.nickname,movieReview.relatedObj.title];
    NSURL *imageURL = [NSURL URLWithString:movieReview.relatedObj.image];
    [cell.rightImageView setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"icon_map_search_empty"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MoiveReview *movieReview = (MoiveReview *)self.movieReviewArray[indexPath.row];
    [self performSegueWithIdentifier:@"ReviewDetailSegue" sender:@(movieReview.ID)];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
    ReviewDetailViewController *controller = (ReviewDetailViewController *)nav.visibleViewController;
    controller.reviewID = [sender intValue];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}



@end
