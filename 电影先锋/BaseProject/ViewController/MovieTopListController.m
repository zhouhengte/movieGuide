//
//  MovieTopListController.m
//  BaseProject
//
//  Created by mis on 15/12/21.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "MovieTopListController.h"
#import "MovieNetManager.h"
#import "MovieTopList.h"
#import "TopListDetailViewController.h"

@interface MovieTopListController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)MovieTopList *movieTopList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,assign)NSInteger pageCount;
@property(nonatomic,assign)NSInteger pageCountTotal;

@end

@implementation MovieTopListController

-(void)viewDidLoad{
    
    _pageCount = 1;
    
    [MovieNetManager getTopListWithStartIndex:1 completionHandle:^(id model, NSError *error) {
        if (!error) {
            self.movieTopList = (MovieTopList *)model;
            self.pageCountTotal = self.movieTopList.pageCount;
            [self.tableView reloadData];
        }else{
            NSLog(@"获取排行榜失败:%@",error);
        }
    }];
    
    
    //顶部刷新
    __weak UITableView *tb = _tableView;
    [_tableView addHeaderRefresh:^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
#warning 顶部刷新还未验证
            [MovieNetManager getTopListWithStartIndex:1 completionHandle:^(id model, NSError *error) {
                if (!error) {
                    self.movieTopList = (MovieTopList *)model;
                    [self.tableView reloadData];
                }else{
                    NSLog(@"获取排行榜失败:%@",error);
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
                
                [MovieNetManager getTopListWithStartIndex:_pageCount completionHandle:^(id model, NSError *error) {
                    if (!error) {
                        MovieTopList *nextMovieTopList = (MovieTopList *)model;
                        [self.movieTopList.topLists addObjectsFromArray:nextMovieTopList.topLists];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.movieTopList.topLists.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopListDetailCell"];
    cell.textLabel.text = self.movieTopList.topLists[indexPath.row].topListNameCn;
    cell.textLabel.numberOfLines = 0;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"TopListDetailSegue" sender:self.movieTopList.topLists[indexPath.row]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
    TopListDetailViewController *controller = (TopListDetailViewController *)nav.visibleViewController;
    controller.toplists = sender;
}

@end
