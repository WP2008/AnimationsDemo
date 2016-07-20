//
//  ViewControllerFour.m
//  maskViewDemo
//
//  Created by wp on 16/7/20.
//  Copyright © 2016年 wp. All rights reserved.
//

#import "ViewControllerFour.h"
#import "UIView+Extension.h"
@interface ViewControllerFour ()

@end

@implementation ViewControllerFour

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 在底层的 图片 background（最后要显示出来）
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    background.image        = [UIImage imageNamed:@"base"];
    background.center       = self.view.center;
    [self.view addSubview:background];
    
    // 在上层的 图片 upGround
    UIImageView *upGround = [[UIImageView alloc] initWithFrame:background.frame];
    upGround.image        = [UIImage imageNamed:@"background"];
    [self.view addSubview:upGround];
    
    
    // maskView 由两个分别加载 “mask1” “mask” 的imageView拼接而成。加在 上层图片上
    UIView *mask      = [[UIView alloc] initWithFrame:upGround.bounds];
    upGround.maskView = mask;
    
    UIImageView *picOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 400)];
    picOne.image        = [UIImage imageNamed:@"mask1"];
    [mask addSubview:picOne];
    
    UIImageView *picTwo = [[UIImageView alloc] initWithFrame:CGRectMake(100, -200, 100, 400)];
    picTwo.image        = [UIImage imageNamed:@"mask"];
    [mask addSubview:picTwo];
    
    
    // 两个imageView的动画 使maskView的alpha通道由 0 变成 1 ，导致 上层图片消失， 达到切换的效果
    [UIView animateWithDuration:2.f delay:2.f options:0 animations:^{
        picOne.y -= 400;
        picTwo.y += 400;
    } completion:^(BOOL finished) {
        
    }];

}


@end
