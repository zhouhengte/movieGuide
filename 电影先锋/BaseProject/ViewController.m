//
//  ViewController.m
//  BaseProject
//
//  Created by tarena on 15/12/15.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Network.h"
#import "MovieNetManager.h"
#import "MovieNews.h"
#import "NewsCell1.h"
#import "NewsCell2.h"
#import "NewsDetailViewController.h"
#import <MJRefresh.h>


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)MovieNews *movieNews;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,assign)NSInteger pageCount;
@property(nonatomic,assign)NSInteger pageCountTotal;



@end

@implementation ViewController

- (MovieNews *)movieNews {
    if(_movieNews == nil) {
        _movieNews = [[MovieNews alloc] init];

    }
    return _movieNews;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageCount = 1;
    
    [MovieNetManager getNewsWithStartIndex:1 completionHandle:^(id model, NSError *error) {
        if (!error) {
            self.movieNews = (MovieNews *)model;
            self.pageCountTotal = self.movieNews.pageCount;
            [self.tableView reloadData];
        }else{
            NSLog(@"获取error:%@",error);
        }
    }];
    
    //顶部刷新
    __weak UITableView *tb = _tableView;
    [_tableView addHeaderRefresh:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [MovieNetManager getNewsWithStartIndex:1 completionHandle:^(id model, NSError *error) {
                if (!error) {
                    self.movieNews = (MovieNews *)model;
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
    
    //底部刷新
    [_tableView addFooterRefresh:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            _pageCount++;
            if (_pageCount<=self.pageCountTotal) {
                
                [MovieNetManager getNewsWithStartIndex:_pageCount completionHandle:^(id model, NSError *error) {
                    if (!error) {
                        MovieNews *nextMovieNews = (MovieNews *)model;
                        [self.movieNews.newsList addObjectsFromArray:nextMovieNews.newsList];
                        [self.tableView reloadData];
                    }else{
                        NSLog(@"获取error:%@",error);
                    }
                }];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (_pageCount>self.pageCountTotal) {
                    [_tableView.mj_footer endRefreshingWithNoMoreData];
                    MBProgressHUD *progressHUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
                    //        纯文本模式
                    progressHUD.mode = MBProgressHUDModeText;
                    progressHUD.labelText = @"已没有可更新内容";
                    //     1.5秒之后 隐藏提示
                    [progressHUD hide:YES afterDelay:1.5];
                }
                [tb endFooterRefresh];
            });
        });
    }];

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"%ld",self.movieNews.newsList.count);
    return self.movieNews.newsList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.movieNews.newsList[indexPath.row].type == 1) {
        NewsCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell2"];
        cell.titleLabel.text = self.movieNews.newsList[indexPath.row].title;
        NSString *firstImageURLStr = self.movieNews.newsList[indexPath.row].images[0].url1;
        NSURL *firstImageURL = [NSURL URLWithString:firstImageURLStr];
        [cell.firstImageView setImageWithURL:firstImageURL placeholderImage:[UIImage imageNamed:@"icon_map_search_empty"]];
        NSString *secondImageURLStr = self.movieNews.newsList[indexPath.row].images[1].url1;
        NSURL *secondImageURL = [NSURL URLWithString:secondImageURLStr];
        [cell.secondImageView setImageWithURL:secondImageURL placeholderImage:[UIImage imageNamed:@"icon_map_search_empty"]];
        NSString *thirdImageURLStr = self.movieNews.newsList[indexPath.row].images[2].url1;
        NSURL *thirdImageURL = [NSURL URLWithString:thirdImageURLStr];
        [cell.thirdImageView setImageWithURL:thirdImageURL placeholderImage:[UIImage imageNamed:@"icon_map_search_empty"]];
        return cell;
    }
    NewsCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCell1"];
    NSString *imageURLStr = self.movieNews.newsList[indexPath.row].image;
    NSURL *imageURL = [NSURL URLWithString:imageURLStr];
    [cell.newsImageView setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"icon_map_search_empty"]];
    cell.titleLabel.text = self.movieNews.newsList[indexPath.row].title;
    cell.subTitleLabel.text = self.movieNews.newsList[indexPath.row].title2;
    cell.commentCount.text = [NSString stringWithFormat:@"评论:%ld",self.movieNews.newsList[indexPath.row].commentCount];
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.movieNews.newsList[indexPath.row].type == 1)
        return 120;
    return 85;
}

//-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewAutomaticDimension;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [self prepareForSegue:[UIStoryboardSegue segueWithIdentifier:@"NewsDetailSegue" source:nil destination:nil performHandler:nil] sender:@[self.movieNews.newsList[indexPath.row].ID]];
//    [self prepareForSegue:[UIStoryboardSegue segueWithIdentifier:@"NewsdetailSegue" source:self destination:nil performHandler:^{
//        
//    }] sender:@(self.movieNews.newsList[indexPath.row].ID)];
    NSNumber *num = @(self.movieNews.newsList[indexPath.row].ID);
    [self performSegueWithIdentifier:@"NewsDetailSegue" sender:num];
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    id desVC = segue.destinationViewController;
//    if ([desVC isKindOfClass:[NewsDetailViewController class]]) {
//        NewsDetailViewController *des = (NewsDetailViewController*)desVC;
//        des.newsDetailURLStr = sender;
//        NSLog(@"----");
//    }
    UINavigationController *controller = (UINavigationController *)segue.destinationViewController;
    NewsDetailViewController *newsController = (NewsDetailViewController *)controller.visibleViewController;
    NSNumber *num = (NSNumber *)sender;
    NSString *str = [NSString stringWithFormat:@"http://api.m.mtime.cn/News/Detail.api?newsId=%@",num];
    newsController.newsDetailURLStr = str;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








@end



