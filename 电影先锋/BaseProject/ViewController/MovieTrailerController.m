//
//  MovieTrailerController.m
//  BaseProject
//
//  Created by mis on 15/12/21.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "MovieTrailerController.h"
#import "MovieTrailer.h"
#import "MovieNetManager.h"
#import "MovieTrailerCell.h"
#import "TrailerDetailViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface MovieTrailerController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)MovieTrailer *movieTrailers;
@property(nonatomic,strong)NSString *TrailerURLStr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation MovieTrailerController

- (NSString *)TrailerURLStr {
    if(_TrailerURLStr == nil) {
        _TrailerURLStr = [[NSString alloc] init];
        _TrailerURLStr = @"http://api.m.mtime.cn/PageSubArea/TrailerList.api";
    }
    return _TrailerURLStr;
}
- (MovieTrailer *)movieTrailers {
    if(_movieTrailers == nil) {
        _movieTrailers = [[MovieTrailer alloc] init];
    }
    return _movieTrailers;
}
-(void)viewDidLoad
{
    
    [MovieNetManager getMovieTrailerWithURL:self.TrailerURLStr  completionHandle:^(id model, NSError *error) {
        if (!error) {
            self.movieTrailers = (MovieTrailer *)model;
            [self.tableView reloadData];
        }else{
            NSLog(@"获取预告片失败error:%@",error);
        }
    }];
    
    
    //顶部刷新
    __weak UITableView *tb = _tableView;
    [_tableView addHeaderRefresh:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
#warning 顶部刷新还未验证
            [MovieNetManager getMovieTrailerWithURL:self.TrailerURLStr completionHandle:^(id model, NSError *error) {
                if (!error) {
                    self.movieTrailers = (MovieTrailer *)model;
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
    //NSLog(@"ddd%lu",(unsigned long)self.movieTrailers.trailers.count);
    return self.movieTrailers.trailers.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieTrailerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieTrailerCell"];
    cell.movieNameLabel.text = self.movieTrailers.trailers[indexPath.row].movieName;
    cell.summaryLabel.text = self.movieTrailers.trailers[indexPath.row].summary;
    NSString *imageURLStr = self.movieTrailers.trailers[indexPath.row].coverImg;
    NSURL *imageURL = [NSURL URLWithString:imageURLStr];
    [cell.coverImageView setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"icon_map_search_empty"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSURL *videoURL = [NSURL URLWithString:self.movieTrailers.trailers[indexPath.row].url];
    //controller对象
    AVPlayerViewController *controller = [[AVPlayerViewController alloc] init];
    controller.player = [AVPlayer playerWithURL:videoURL];
    //显示
    [self presentViewController:controller animated:YES completion:nil];
    //没必要了，直接使用AVPlayerViewController
    //[self performSegueWithIdentifier:@"TrailerDetailSegue" sender:self.movieTrailers.trailers[indexPath.row].url];
}

//没必要了，直接使用AVPlayerViewController
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    UINavigationController *navController = (UINavigationController *)segue.destinationViewController;
//    TrailerDetailViewController *trailerDetailViewController = (TrailerDetailViewController *)navController.visibleViewController;
//    trailerDetailViewController.trailerURLStr = sender;
//}






@end
