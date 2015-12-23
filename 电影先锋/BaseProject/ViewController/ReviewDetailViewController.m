//
//  ReviewDetailViewController.m
//  BaseProject
//
//  Created by mis on 15/12/22.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ReviewDetailViewController.h"
#import "MovieNetManager.h"
#import "MovieReviewDetail.h"

@interface ReviewDetailViewController ()<UIWebViewDelegate>

@property(nonatomic,strong)MovieReviewDetail *reviewDetail;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ReviewDetailViewController

-(void)viewDidLoad{
    //NSLog(@"%ld",self.reviewID);
    [MovieNetManager getReviewDetailWithID:self.reviewID completionHandle:^(id model, NSError *error) {
        if (!error) {
            self.reviewDetail = (MovieReviewDetail *)model;
            NSURL *URL = [NSURL URLWithString:self.reviewDetail.url];
            NSURLRequest *request = [NSURLRequest requestWithURL:URL];
            
            [self.webView loadRequest:request];
        }else{
            NSLog(@"获取影评详情失败:%@",error);
        }
    }];
    //取消自适应，去除上方留白
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.webView.scalesPageToFit = YES;
}



- (IBAction)BackToReview:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
