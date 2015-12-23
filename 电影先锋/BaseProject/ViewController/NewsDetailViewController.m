//
//  NewsDetailViewController.m
//  BaseProject
//
//  Created by mis on 15/12/20.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "MovieNetManager.h"
#import "MovieNewsDetail.h"


@interface NewsDetailViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property(nonatomic,strong)MovieNewsDetail *movieNewsDetail;



@end

@implementation NewsDetailViewController

-(void)viewDidLoad
{
    [MovieNetManager getNewsDetailWithURL:self.newsDetailURLStr completionHandle:^(id model, NSError *error) {
        if (!error) {
            self.movieNewsDetail = (MovieNewsDetail *)model;
            NSURL *URL = [NSURL URLWithString:self.movieNewsDetail.url];
            NSURLRequest *request = [NSURLRequest requestWithURL:URL];
            
            [self.webView loadRequest:request];
        }else{
            NSLog(@"获取新闻详情页失败%@",error);
        }
        
    }];
    //取消自适应，去除上方留白
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    self.webView.scalesPageToFit = YES;

    
    
    
}

- (IBAction)backToNews:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}









@end
