//
//  TopListDetailViewController.m
//  BaseProject
//
//  Created by mis on 15/12/21.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TopListDetailViewController.h"
#import "MovieNetManager.h"
#import "ActorTopListDetail.h"
#import "MovieTopListDetail.h"
#import "MovieTopListDetailCell.h"
#import "ActorTopListDetailCell.h"

@interface TopListDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)ActorTopListDetail *actorTopListDetail;
@property (nonatomic,strong)MovieTopListDetail *movieTopListDetail;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@end


@implementation TopListDetailViewController

- (ActorTopListDetail *)actorTopListDetail {
    if(_actorTopListDetail == nil) {
        _actorTopListDetail = [[ActorTopListDetail alloc] init];
    }
    return _actorTopListDetail;
}

- (MovieTopListDetail *)movieTopListDetail {
    if(_movieTopListDetail == nil) {
        _movieTopListDetail = [[MovieTopListDetail alloc] init];
    }
    return _movieTopListDetail;
}

-(void)viewDidLoad{
//    NSLog(@"%@",self.toplists);
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.titleLabel.text = self.toplists.topListNameCn;
    self.subtitleLabel.text = self.toplists.summary;
    [MovieNetManager getTopListDetailWithStartIndex:1 ID:self.toplists.ID Style:self.toplists.type completionHandle:^(id model, NSError *error) {
        if (!error) {
            if ([model isKindOfClass:[ActorTopListDetail class]]) {
                self.actorTopListDetail = (ActorTopListDetail *)model;
            }else{
                self.movieTopListDetail = (MovieTopListDetail *)model;
            }
            [self.tableView reloadData];
        }else{
            NSLog(@"获取排行榜详情失败:%@",error);
        }
    }];
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.toplists.type == 2) {
        return self.actorTopListDetail.persons.count;
    }
    return self.movieTopListDetail.movies.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.toplists.type == 2) {
        ActorTopListDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActorTopListDetailCell"];
        Persons *person = self.actorTopListDetail.persons[indexPath.row];
        NSURL *imageURL = [NSURL URLWithString:person.posterUrl];
        [cell.posterImageView setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"icon_map_search_empty"]];
        cell.nameLabel.text = person.nameCn;
        cell.nameENLabel.text = person.nameEn;
        cell.summaryTextView.text = person.summary;
//        [cell sizeThatFits:CGSizeMake(self.view.frame.size.width, 100)];
        return cell;
    }else{
        MovieTopListDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieTopListDetailCell"];
        NSURL *imageURL = [NSURL URLWithString:self.movieTopListDetail.movies[indexPath.row].posterUrl];
        [cell.posterImageView setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"icon_map_search_empty"]];
        cell.MovieNameCNLabel.text = self.movieTopListDetail.movies[indexPath.row].name;
        cell.movieNameENLabel.text = self.movieTopListDetail.movies[indexPath.row].nameEn;
        cell.director.text = [NSString stringWithFormat:@"导演:%@",self.movieTopListDetail.movies[indexPath.row].director];
        cell.actorLabel.text = [NSString stringWithFormat:@"主演:%@",self.movieTopListDetail.movies[indexPath.row].actor];
        cell.releaseDate.text = [NSString stringWithFormat:@"上映日期:%@",self.movieTopListDetail.movies[indexPath.row].releaseDate];
        cell.remarkTextView.text = self.movieTopListDetail.movies[indexPath.row].remark;
        [cell.remarkTextView setContentOffset:CGPointMake(0, 0)];
        return cell;
    }
}

//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.toplists.type == 2) {
//        return 100;
//    }
//    return UITableViewAutomaticDimension;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    
    return cell.frame.size.height;
}


- (IBAction)BackToTopList:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
