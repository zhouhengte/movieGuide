//
//  TrailerDetailViewController.m
//  BaseProject
//
//  Created by mis on 15/12/21.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "TrailerDetailViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface TrailerDetailViewController ()
//在线播放音频/视频的对象
@property (nonatomic, strong) AVPlayer *player;
//playerLayer对象(显示视频到界面上)
@property (nonatomic, strong) AVPlayerLayer *layer;
@end


@implementation TrailerDetailViewController

-(void)viewDidLoad{
    //视频
    //NSString *videoStr = @"http://vfx.mtime.cn/Video/2015/11/19/mp4/151119084612114938.mp4";
    self.player = [AVPlayer playerWithURL:[NSURL URLWithString:self.trailerURLStr]];
    self.layer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    //设置frame
    self.layer.frame = self.view.bounds;
    //视频填充全屏
    self.layer.videoGravity=AVLayerVideoGravityResizeAspect;
    //添加到view上
    [self.view.layer addSublayer:self.layer];
    //播放
    [self.player play];
}

- (IBAction)BackToTrailer:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
